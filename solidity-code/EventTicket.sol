pragma solidity 0.4.24;

contract EventTicket {
    
    //100,"jisang's event ticket","http://localhost:8080"
    // hd
    uint PRICE_TICKET = 1 ether;
    address owner = msg.sender;
    
    struct EventTicket {
        uint totalAmount;
        uint remainAmount;
        uint balance;
        string desc;
        string webUrl;
    }
    
    EventTicket public myEventTickets;
    mapping(address => uint) buyerTicketAmount;
    
    constructor(uint _ticketInitialAmount, string _desc, string _webUrl) public {
        myEventTickets.totalAmount = _ticketInitialAmount;
        myEventTickets.remainAmount = _ticketInitialAmount;
        myEventTickets.balance = 0;
        myEventTickets.desc = _desc;
        myEventTickets.webUrl = _webUrl;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    function buyTicket(uint _ticketAmount) onlyOwner public payable{
        require(myEventTickets.remainAmount >= _ticketAmount);
        require(msg.value >= _ticketAmount * PRICE_TICKET);
        require(buyerTicketAmount[msg.sender] == 0);
        
        buyerTicketAmount[msg.sender] = _ticketAmount;
        myEventTickets.remainAmount -= _ticketAmount;
        myEventTickets.balance += msg.value;
    }
    
    function refundTicket(address _buyerAddr) onlyOwner public payable{
        uint ticketAmount = buyerTicketAmount[_buyerAddr];
        
        require(myEventTickets.balance >= ticketAmount * PRICE_TICKET);
        require(myEventTickets.totalAmount >= myEventTickets.remainAmount + ticketAmount);
        
        address(_buyerAddr).transfer(PRICE_TICKET + ticketAmount);
        myEventTickets.remainAmount += ticketAmount;
        delete buyerTicketAmount[_buyerAddr];
    }
    
    function getBuyerInfo() public view returns(uint) {
        return buyerTicketAmount[msg.sender];
    }
    
    function getOwner() public view returns(address){
        return owner;
    }
    
}