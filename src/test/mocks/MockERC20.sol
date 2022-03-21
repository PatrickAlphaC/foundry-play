// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20 ("Mock ERC20", "MERC") {
        _mint(msg.sender, 1000000e18);
    }

}