// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract General {
    uint public contractBalance = 0; // Declare and initialize variable
    
    function getContractBalance() public view returns (uint) {
        return contractBalance;
    }

    // Pure function: Performs computation without reading/writing blockchain state
    function addNumbers(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // Private function: Can only be called within this contract
    function _internalCalculation(uint a) private pure returns (uint) {
        return a * 2;
    }

    // Public function that uses the private function
    function doubleValue(uint value) public pure returns (uint) {
        return _internalCalculation(value);
    }

    // Payable function: Allows contract to receive Ether directly
    receive() external payable {
        contractBalance += msg.value;  // Now it's declared, so no error!
        
    }}