// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract TaskManager {

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
    uint count;

    mapping(uint => Task) tasks;
    mapping(address => bool) premiums;
    // event est utile lors de l'utilisation d'un smart contract avec une UI (permet d'avoir des notifications)
    event NewTask(Task task, uint time);

    constructor() {
        admin = msg.sender;
        count = 0;
    }

    // memory indique qu'on stocke la variable temporairement et non dans le smart contract comme pour les autres variables
    function addTask(string memory content) public {
        Task memory task = Task(count, Priority.LOW, content, block.timestamp, false);
        tasks[count] = task;
        count++;

        // emit permet d'émettre l'événement
        emit NewTask(task, block.timestamp);
    }

    function completeTask(uint _count) public {
        Task memory task = tasks[_count];
        task.completed = true;
        tasks[_count] = task;
    }
}