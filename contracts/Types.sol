// SPDX-License-Identifier: GPL-3.0 

pragma solidity >= 0.7.0 < 0.9.0;

contract Types {
    uint256 public count;
    string public message;
    bool public below1 = false;

    constructor() {
        message = "Contract to increment or decrement.";
    }

    function increment() public {
        count = count + 1;
        below1 = count < 1;
    }

    function decrement() public {
        count = count - 1;
        below1 = count < 1;
    }
}