pragma solidity 0.4.24;

contract Demo {

   address owner = msg.sender;

   uint[] orders;

   address public hynixAddress = 0xe2b1b3f6aaeef2d8f60b9ccf4e0c888257424854;
   address public lgeAddress = 0x4ad61068b14553375d5c5e851c0883dec10e9da8;
   address public cjlogAddress = 0xb18efd74f248781ac0d9cb70b67dba2f0000f5fd;
   address public idbinsAddress = 0x3ef1b73ab4b6caddb7274ef128de82fd01e70b9c;
   address public kebhanaAddress = 0x32522a4fdd5910a0bdc59e93586a7ed386cca656;

   modifier onlyOwner() {
       require(msg.sender == owner);
       _;
   }

   function setStakeHolder(address _hynix, address _lge, address _cjlog, address _idbins, address _kebhana) onlyOwner public{
       hynixAddress = _hynix;
       lgeAddress = _lge;
       cjlogAddress = _cjlog;
       idbinsAddress = _idbins;
       kebhanaAddress = _kebhana;
   }

   //0:order, 1:prod, 2:send, 3:delivery, 4:receive, 5:payment
   function procOrder(uint _type, uint _txId) public{

       if (_type == 0){
           require(msg.sender == lgeAddress);

       }else if (_type == 1){
           require(msg.sender == hynixAddress);

       }else if (_type == 2){
           require(msg.sender == hynixAddress);

       }else if (_type == 3){
           require(msg.sender == cjlogAddress);

       }else if (_type == 4){
           require(msg.sender == lgeAddress);

       }else if (_type == 5){
           require(msg.sender == kebhanaAddress);

       }

       orders.push(0);
       orders[_txId] = _type;
   }

   function getOrder(uint _txId) public view returns (uint) {
       return orders[_txId];
   }

}