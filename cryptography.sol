// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.0;
 contract crypto{
 function hashData(string memory data) pure  public returns (bytes32) {
        bytes32 hashResult = keccak256(abi.encodePacked(data));
        return hashResult;
    }
}