// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;


contract Greeter {
    string greeting;
    address owner;

    modifier onlyOwner {
        require(isOwner(), "Only owner can do that!");
        _;
    }
    
    constructor(string memory _greeting) {
        greeting = _greeting;
        owner = msg.sender;
    }

    function sayHello() public view returns(string memory) {
        if (isOwner()) {
            return "Hello, you are my owner";
        } else {
            return greeting;
        }
    }

    function setGreeting(string memory _newGreeting) public onlyOwner {
        greeting = _newGreeting;
    }
    
    // Check if the caller is the owner of this smart contract
    function isOwner() view private returns(bool) {
        return msg.sender == owner;    
    }
}
