// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract Functions {
    uint256 public number;

    function set(uint256 _num) public {
        add(_num);
    }

    // private indique qu'on ne peut accéder à cette fonction qu'à l'intérieur de ce contrat
    function add(uint256 _num) private {
        number = number + _num;
    }

    // view permet d'indiquer que l'on souhaite uniquement consulter de la donnée
    // returns permet d'indiquer le type de la donnée que l'on souhaite retourné
    // une fonction view est gratuite (pas de coût de gas) car on consulte uniquement la donnée, sans la modifier
    function get() view public returns(uint256 num) {
        return number;
    }

    // return permet d'indiquer une valeur retournée
    function get_square() view public returns(uint256 num) {
        return number * number;
    }

    // pure permet d'indiquer qu'il s'agit d'une fonction qui ne modifie ou ne consulte pas de données présentes sur la blockchain
    // une fonction pure est généralement private (public ici juste pour tester avec une instance)
    function sum(uint256 num1, uint256 num2) pure public returns(uint256 result) {
        return num1 + num2;
    }
}