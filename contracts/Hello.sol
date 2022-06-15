// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract Hello {

    // public permet de lire la valeur de la variable à l'extérieur du contrat
    string public message;

    // Permet d'initialiser des valeurs à la création du contrat
    constructor() {
        message = "I was here!";
    }

    // memory indique qu'on stocke la variable temporairement et non dans le smart contract comme pour les autres variables
    function store(string memory _message) public {
        message = _message;
    }

    // Permet de lire et retourner une valeur présente sur la blockchain
    // function retrieve() public view returns(string memory _message) {
    //     return message;
    // }
}