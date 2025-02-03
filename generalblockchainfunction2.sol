//SPDX-License-Identifier: MIT
 pragma solidity ^0.8.0;
 contract general{
    uint public contractBalance = 0;
     address private owner;
    function deposit() public payable {
        contractBalance += msg.value;
       
    }

    function withdraw(uint _amount) public onlyOwner {
        require(_amount <= contractBalance, "Insufficient funds");
        contractBalance -= _amount;
      
    }
     modifier onlyOwner {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }
    }
