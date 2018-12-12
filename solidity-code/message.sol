pragma solidity 0.4.24;

contract Message {
    
    struct Deposit{
        string message;
        uint amount;
    }
    
    mapping(address => Deposit) deposits;
    address owner = msg.sender;
    uint public contractBalance;
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    function setMessage(string _newMessage) public payable {
        Deposit memory newDeposit;
        newDeposit.message = _newMessage;
        newDeposit.amount = msg.value;
        deposits[msg.sender] = newDeposit;
        contractBalance += msg.value;
    }
    
    function getMessage(address _sender) view public returns(string, uint) {
        return (deposits[_sender].message, deposits[_sender].amount);
    }
    
    function removeMessage() public {
        address(msg.sender).transfer(deposits[msg.sender].amount);
        contractBalance -= deposits[msg.sender].amount;
        delete deposits[msg.sender];
    }
    
}