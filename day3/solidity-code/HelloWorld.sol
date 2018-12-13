pragma solidity 0.4.24;

contract HelloWorld2 {
    
    string public message = "Default Message!";
    uint public myBalance;
    address owner;
    
    mapping(address => string) otherMessagesStorage;
    
    constructor () public {
        message = "Constructor Message!";
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function setMessage(string _newMessage) onlyOwner public {
        /*require(msg.sender == owner);*/
        message = _newMessage;
    }
    
    function receiveEther() public payable {
        myBalance += msg.value;
    }
    
    function othersMessages(string _message) public {
        otherMessagesStorage[msg.sender] = _message;
    }
    
    function getothersMessage(address _sender) view public returns(string) {
        return otherMessagesStorage[_sender];
    }
    
    function removeMyMessage() public {
        delete otherMessagesStorage[msg.sender];
    }
    
}