// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 


enum VotingStatus { NotStarted, Ongoing, Ended }

contract VotingSystem {
    
    address public owner;
    uint public totalVotes;
    bool public votingActive;
    string public winner;

    
    mapping(address => bool) public hasVoted;
    mapping(string => uint) public votesReceived;

   
    event VoteCasted(address voter, string candidate);
    event VotingStatusChanged(VotingStatus status);

    
    constructor() {
        owner = msg.sender;
        votingActive = false;
        totalVotes = 0;
    }

    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action.");
        _;
    }

   
    function startVoting() public onlyOwner {
        require(!votingActive, "Voting is already active.");
        votingActive = true;
        emit VotingStatusChanged(VotingStatus.Ongoing);
    }

   
    function vote(string memory candidate) public {
        require(votingActive, "Voting has not started.");
        require(!hasVoted[msg.sender], "You have already voted.");

        hasVoted[msg.sender] = true; 
        votesReceived[candidate] += 1;
        totalVotes++;

        emit VoteCasted(msg.sender, candidate);
    }

   
    function endVoting() public onlyOwner {
        require(votingActive, "Voting is not active.");
        votingActive = false;
        emit VotingStatusChanged(VotingStatus.Ended);

        determineWinner();
    }

    
    function determineWinner() private {
        string memory leadingCandidate;
        uint maxVotes = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (votesReceived[candidates[i]] > maxVotes) {
                maxVotes = votesReceived[candidates[i]];
                leadingCandidate = candidates[i];
            }
        }

        winner = leadingCandidate;
    }

    
    string[] public candidates;

    
    function addCandidate(string memory candidate) public onlyOwner {
        candidates.push(candidate);
    }

   
    function getVotes(string memory candidate) public view returns (uint) {
        return votesReceived[candidate];
    }
}
