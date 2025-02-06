// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract EventProgram{
    address public owner;
    struct Event{
        string name;
        string location;
        string Day;
        uint256 Date;
        uint256 ticketPrice;
        uint256 ticketAvailable;
        uint256 ticketSold;


    }
    Event []public events;
    modifier onlyOwner(){
     require(msg.sender== owner,"owner only modify the event"); 
     _;  
    } 
    constructor(){
        owner=msg.sender;

    }
    function CreateEvent(
        string memory _name,
        string memory _location,
        string memory _Day,
        uint256 _Date,
        uint256 _ticketPrice,
        uint256 _ticketAvailable
     

    )public onlyOwner{
      events.push(Event({
    name: _name,
    location: _location,
    Day: _Day, 
    Date: _Date,
    ticketPrice: _ticketPrice,
    ticketAvailable: _ticketAvailable,
    ticketSold: 0
}));
    }
        function getEvent(uint256 index) public view returns(
            string memory,
            string memory,
            string memory,
            uint256,
            uint256 ,
            uint256,
            uint256)
            {
                require(index<events.length,"event does not exist");
                Event memory evt=events[index];
            return (
            evt.name,
            evt.location,
            evt.Day,
            evt.Date,
            evt.ticketPrice,
            evt.ticketAvailable,
            evt.ticketSold
        );}
        function totalEvents() public view returns (uint256) {
        return events.length;
    }


    }
