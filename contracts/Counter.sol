// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract Counter {
    uint256 public count;

    function increment(uint256 value) public isLessThan10(value) {
        count = count + value;
    }

    // on modifie la sémantique de cette fonction en faisant appel au modifier isLessThan10
    function decrement(uint256 value) public isLessThan10(value) {
        count = count - value;
    }

    // permet de modifier l'éxécution du code source sur la blockchain    
    modifier isLessThan10(uint256 value) {
        // require permet d'ajouter des conditions pour l'application de cette fonction
        // require prend 2 paramètres : la condition et le message d'erreur
        require(value <= 10, 'value cannot be more than 10.');
        
        // _; correspond à l'éxécution de la fonction
        _;
    }
}