// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleTransaction {
    string public name;
    string public place;
    uint public tokenId = 0;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setDetails(string memory _name, string memory _place) public {
        name = _name;
        place = _place;
        tokenId++;
    }

    function transact() public payable {
        require(msg.value > 0, "Send some Ether");
        payable(owner).transfer(msg.value);
    }
}
