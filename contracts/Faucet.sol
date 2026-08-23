// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Faucet {
    uint256 public amountAllowed = 100 * 10**18;
    mapping(address => uint256) public lockTime;
    
    function requestTokens() external {
        require(block.timestamp > lockTime[msg.sender], "Cooldown period active");
        lockTime[msg.sender] = block.timestamp + 1 days;
    }
}
