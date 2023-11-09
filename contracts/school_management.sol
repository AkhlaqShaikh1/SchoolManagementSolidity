// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


import "contracts/modifiers.sol";
import "hardhat/console.sol";

contract SchoolManagement is MyModifiers{
    struct StudentInformation{
        string studentName;
        uint studentId;
        string grade;
        uint batch;
    }

    address private admin;
    StudentInformation[] students;

    constructor(){
        admin = msg.sender;
    }

    event StudentAdded( uint timestamp);
    function addStudent(uint id, string memory name, string memory grade, uint batch) public {
    require(msg.sender == admin, "You are not admin!!");
    require(students[id].studentId != id, "Student Already Exists");
    // Create a new StudentInformation struct and add it to the mapping
    students.push( StudentInformation(name, id, grade, batch));
    emit StudentAdded(block.timestamp);
}
    function showAllStudents() external view returns(StudentInformation[] memory student){
        require(students.length>0);
        return student;
    }



    
}