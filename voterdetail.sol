
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract VoterEligibility {

    struct Voter {
        string name;
        string place;
        uint256 age;
    }

    mapping(address => Voter) public voters;

    event VoterRegistered(address voter, string name, string place, uint256 age);
    event EligibilityChecked(address voter, string message);

    function registerVoter(string memory _name, string memory _place, uint256 _age) public {
        voters[msg.sender] = Voter(_name, _place, _age);
        emit VoterRegistered(msg.sender, _name, _place, _age);
    }


    function checkEligibility() public {
        Voter storage voter = voters[msg.sender];
        string memory message = (voter.age >= 18) ? "Eligible to vote" : "Not eligible to vote";

        emit EligibilityChecked(msg.sender, message);
    }

    function getVoterDetails(address _voter) public view returns (string memory name, string memory place, uint256 age) {
        Voter storage voter = voters[_voter];
        return (voter.name, voter.place, voter.age);
    }
}

