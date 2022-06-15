// SPDX-License-Identifier: GPL-3.0 

pragma solidity >= 0.7.0 < 0.9.0;

contract Types {
    string[] public messages;
    mapping(address => string) public accounts;

    function add(string memory _message) public {
        messages.push(_message);
        accounts[msg.sender] = _message;
    }
}