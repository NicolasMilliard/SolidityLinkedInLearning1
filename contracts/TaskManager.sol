// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

// SafeMath est déjà inclu à partir de la version 0.8.0
// On l'utilise ici pour éviter l'overflow
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract TaskManager {

    using SafeMath for uint256;

    // enum permet une variable définie et personnalisée regroupant plusieurs constantes
    enum Priority { LOW, MEDIUM, HIGH }

    // struct permet de créer une variable personnalisée regroupant plusieurs types de variables
    struct Task {
        uint id;
        Priority priority;
        string content;
        uint timestamp;
        bool completed;
    }
    address admin;
    uint private count;

    mapping(uint => Task) tasks;
    mapping(address => bool) public premiums;
    // event est utile lors de l'utilisation d'un smart contract avec une UI (permet d'avoir des notifications)
    event NewTask(Task task, uint time);

    constructor() {
        admin = msg.sender;
        count = 0;
    }

    // memory indique qu'on stocke la variable temporairement et non dans le smart contract comme pour les autres variables
    function addTask(string memory content) public isPremium {
        Task memory task = Task(count, Priority.LOW, content, block.timestamp, false);
        tasks[count] = task;
        count = SafeMath.add(count, 1);

        // emit permet d'émettre l'événement
        emit NewTask(task, block.timestamp);
    }

    function completeTask(uint _count) public {
        Task memory task = tasks[_count];
        task.completed = true;
        tasks[_count] = task;
    }

    function upgradePlan() public payable {
        require(msg.value >= 5 wei, 'No sufficient funds.');
        premiums[msg.sender] = true;
    }

    function getTasksCount() view public returns(uint countTasks){
        return count;
    }

    // on vérifie qu'il y a 10 tâches au maximum ou que l'adresse est déjà enregistrée comme premium
    modifier isPremium() {
        require(count + 1 <= 10 || premiums[msg.sender], 'Please upgrade to add more than 10 tasks.');
        _;
    }
}