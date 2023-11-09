// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract MyModifiers{

    modifier onlyAdmin(address owner){
        require(msg.sender == owner);
        // require(msg.sender != address(0));
        _;
    }
}