// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../StakeContract.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract StakeContractTest is DSTest {
    StakeContract public stakeContract;
    ERC20 public mockToken; 

    function setUp() public {
        stakeContract = new StakeContract();
        mockToken = new ERC20("Mock Token", "MT");
        mockToken.mint(msg.sender, 100e18);
    }

    function test_staking_tokens_fuzz(uint256 amount) public {
        mockToken.approve(address(stakeContract), amount);
        bool stakePassed = stakeContract.stake(amount);
        assertTrue(stakePassed);
    }

    function 
}
