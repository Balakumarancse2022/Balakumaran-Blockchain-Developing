// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockchainFunctions {
    // State variables (stored on the blockchain)
    address public owner;
    uint public contractBalance;

    // Events (for logging)
    event Deposit(address indexed sender, uint amount);
    event Withdrawal(address indexed receiver, uint amount);
    event DataHashed(address indexed user, bytes32 hashResult);

    // Constructor: Sets the owner when contract is deployed
    constructor() {
        owner = msg.sender;
    }
}