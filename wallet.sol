//SPDX-License-Identifier :MIT
pragma solidity ^0.8.0;
contract wallet{
    mapping(address=>uint256) public balances;
    address public owner;
    constructor(){
        owner=msg.sender;

    }
    function deposit() public payable{
        require(msg.value>0,"Deposit can be graeter than 0");
        balances [msg.sender] += msg.value;

        }
    function withdrawn (uint256 amount) public{
        require(balances[msg.sender]>=amount,"Insufficient amount");
        payable (msg.sender).transfer(amount);
        balances[msg.sender]-= amount;
    }

  
    function getContractBalance() public view returns (uint256) {
        require(msg.sender == owner, "Only owner can view balance");
        return address(this).balance;
    }

    
}