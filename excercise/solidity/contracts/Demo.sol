pragma solidity ^0.4.23;

contract Demo {
    address[] public orders;
    
    function createOrder() public returns(Order) {
        Order order = new Order();
        orders.push(address(order));
        return order;
    }

    function receiveOrderProduction public returns() {

    }

    function completeOrderProduction public returns() {

    }

    function receiveOrderDelivery public returns() {

    }

    function completeOrderDelivery public returns() {

    }

    function receiveOrderVerification public returns() {

    }

    function completeOrderVerification public returns() {

    }

    function receiveOrderPayment public returns() {

    }

    function completeOrderPayment public returns() {

    }

    function completeOrder public returns() {

    }

}

/*
contract Product {
    uint id;
    string name;
    uint price;
    uint stock;

    constructor(uint _id, string _name, uint _price, uint _stock) public {
        id = _id;
        name = _name;
        price = _price;
        stock = _stock;
    }
}
*/

contract Order {
    struct Company {
        string name;
        address accountAddr;
    }
    
    struct StakeHolders {
        Company producer;
        Company consumer;
        Company logistics;
        Company bank;
        Company insuarance;
    }

    //Created, ProdutionReceived, ProductionCompleted, DeliveryReceived, DeliveryCompleted, VerificationReceived, VerificationCompleted, PayReceived, PayCompleted, Completed
    string public state;
    uint price;
    uint public auditDtm;
    string public auditName;
    StakeHolders public stakeHolders;

    constructor(uint _price, string _auditName, string _producerName, address _producerAddr, string _consumerName, address _consumerAddr, string _logisticsName, address _logisticsAddr, string _bankName, address _bankAddr, string _insuaranceName, address _insuaranceAddr) public {
        state = "Created";
        price = _price;
        auditDtm = now;
        auditName = _auditName; 
        stakeHolders.producer.name = _producerName;
        stakeHolders.producer.accountAddr = _producerAddr;
        stakeHolders.consumer.name = _consumerName;
        stakeHolders.consumer.accountAddr = _consumerAddr;
        stakeHolders.logistics.name = _logisticsName;
        stakeHolders.logistics.accountAddr = _logisticsAddr;
        stakeHolders.bank.name = _bankName;
        stakeHolders.bank.accountAddr = _bankAddr;
        stakeHolders.bank.name = _insuaranceName;
        stakeHolders.bank.accountAddr = _insuaranceAddr;
    }
}