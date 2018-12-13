pragma solidity ^0.4.23;

contract Demo {
    address[] public orders;

    createOrder


}

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
    
    uint public id = 0;
    //Created, ProdutionReceived, ProductionCompleted, DeliveryReceived, DeliveryCompleted, VerificationReceived, VerificationCompleted, PayReceived, PayCompleted, Completed
    string public state;
    uint public auditDtm;
    string public auditName;
    StakeHolders public stakeHolders;

    constructor(uint _id, string _auditName, string _producerName, address _producerAddr, string _consumerName, address _consumerAddr, string _logisticsName, address _logisticsAddr, string _bankName, address _bankAddr, string _insuaranceName, address _insuaranceAddr) public {
        id = _id;
        state = "Created";
        auditDtm = block.timestamp;
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