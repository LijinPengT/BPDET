// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ETSC {

    address public DN;
    bytes pk_DN;
    mapping(address=>uint) Valid_users;

    
    constructor(bytes memory pkdn){
         DN = msg.sender;
         pk_DN = pkdn;
    }

    function register(address user) public {
        
    }
}