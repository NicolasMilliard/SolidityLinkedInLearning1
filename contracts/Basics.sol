// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract Storage {

    uint storedData;

    function set(uint x) public {
        storedData = x;
    }
    
    // Permet de lire et retourner une valeur présente sur la blockchain
    function get() public view returns (uint) {
        return storedData;
    }
}