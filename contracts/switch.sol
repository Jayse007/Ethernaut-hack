// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//0x20606e15

contract Demo {
    function code() external pure returns (bytes memory) {
        bytes memory data =abi.encodeWithSignature("turnSwitchOn()");
        return data;
    }
}

0x76227e120000000000000000000000000000000000000000000000000000000000020606e15