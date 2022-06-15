// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract Units {
    address admin;
    uint timeLimit;
    uint public count = 0;

    constructor() {
        // msg est une variable globale et sender nous donne l'adresse de celui qui fait appel au contrat, qui fait la transaction
        // ici on initialise admin avec l'adresse du contrat
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        // require permet de gérer les messages d'erreur, retourne true ou false
        require(admin == msg.sender, 'Only admin can change count');
        _;
    }

    function start() private {
        // permet de récupérer le timestamp du bloc actuel et lui ajoute 5 secondes
        timeLimit = block.timestamp + 5 seconds;
    }

    function increment() public onlyAdmin {
        // on oblige l'utilisateur à attendre 5 secondes entre 2 appels sinon on affiche un message d'erreur
        require(block.timestamp > timeLimit, 'Please wait 5 seconds before submitting again.');
        count++;
        start();
    }
}