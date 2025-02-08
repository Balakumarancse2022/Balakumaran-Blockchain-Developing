//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract updatebalance{
    mapping(address=>uint) public balances;
    function updateBalance(uint newBalance) public{
        balances[msg.sender]=newBalance;
        
    }
}
