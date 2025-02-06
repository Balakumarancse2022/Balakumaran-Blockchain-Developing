// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract eventdetails{
    event EventCreate(string name,uint256 ticketavailability);
    function createEvent(string memory _name,uint256 _ticketavailability)public{
        emit EventCreate(_name,_ticketavailability);
    }
}