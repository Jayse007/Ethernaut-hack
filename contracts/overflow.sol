//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Overflow {

    function overflow() external pure returns (int) {
        int x = type(int).min;
         unchecked {return -x;}
    }


}