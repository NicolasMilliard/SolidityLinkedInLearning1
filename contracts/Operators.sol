// SPDX-License-Identifier: GPL-3.0 

pragma solidity >= 0.7.0 < 0.9.0;

contract Operators {
    uint number;

    constructor(uint num) {
        // Nous aurons à renseigner une valeur d'état pour que la valeur de number ait une première valeur dès la création du contrat
        number = num;
    }

    function add(uint num) public {
        number = number + num;
    }

    function substract(uint num) public {
        number = number - num;
    }

    function result() public view returns(uint) {
        return number;
    }
}