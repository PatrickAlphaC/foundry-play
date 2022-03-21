// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StakeContract {
    
    mapping(address => uint256) public s_balances;

    constructor () {}

    function stake(uint256 amount, address token) external returns(bool){
        s_balances[msg.sender] += amount;
        IERC20(token).transferFrom(msg.sender, address(this), amount);
        return true;
    }
}
