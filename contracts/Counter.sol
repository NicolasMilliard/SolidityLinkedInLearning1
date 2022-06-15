// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract Counter {
    uint256 public count;

    function increment() public {
        count = count + 1;
    }

    function decrement() public {
        // require permet d'ajouter des conditions pour l'application de cette fonction
        // require prend 2 paramètres : la condition et le message d'erreur
        require(count >= 1, 'Count cannot be negative.');
        count = count - 1;
    }
}