// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankSystem {
    struct User {
        string name;
        string bank;
        string branch;
        uint256 balance;
    }
    
    mapping(address => User) public users;
    
    uint256 public defaultDeposit = 1000;
    uint256 public defaultWithdraw = 500;
    
    modifier onlyRegistered() {
        require(bytes(users[msg.sender].name).length > 0, "User not registered");
        _;
    }
    
    function registerUser(string memory _name, string memory _bank, string memory _branch) public {
        require(bytes(users[msg.sender].name).length == 0, "User already registered");
        users[msg.sender] = User(_name, _bank, _branch, 0);
    }
    
    function deposit(uint256 _amount) public onlyRegistered {
        require(_amount > 0, "Deposit amount must be greater than zero");
        users[msg.sender].balance += _amount;
    }
    
    function defaultDepositAmount() public onlyRegistered {
        users[msg.sender].balance += defaultDeposit;
    }
    
    function withdraw(uint256 _amount) public onlyRegistered {
        require(_amount > 0, "Withdraw amount must be greater than zero");
        require(users[msg.sender].balance >= _amount, "Insufficient balance");
        users[msg.sender].balance -= _amount;
    }
    
    function defaultWithdrawAmount() public onlyRegistered {
        require(users[msg.sender].balance >= defaultWithdraw, "Insufficient balance");
        users[msg.sender].balance -= defaultWithdraw;
    }
    
    function checkBalance() public view onlyRegistered returns (uint256) {
        return users[msg.sender].balance;
    }
}
