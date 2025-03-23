// SPDX-License-Identifier: UNLICENCED
pragma solidity ^0.8.0;

contract TodoList {
    struct Task {
        uint id;
        string description;
        bool completed;
    }

    Task[] public tasks;
    uint public nextId;

    event TaskCreated(uint id, string description);
    event TaskCompleted(uint id, bool completed);

    function addTask(string memory _description) public {
        tasks.push(Task(nextId, _description, false));
        emit TaskCreated(nextId, _description);
        nextId++;
    }

    function markTaskCompleted(uint _id) public {
        require(_id < tasks.length, "Task does not exist");
        tasks[_id].completed = true;
        emit TaskCompleted(_id, true);
    }

    function getTask(uint _id) public view returns (uint, string memory, bool) {
        require(_id < tasks.length, "Task does not exist");
        Task memory task = tasks[_id];
        return (task.id, task.description, task.completed);
    }
    
    function getAllTasks() public view returns (Task[] memory) {
        return tasks;
    }
}
