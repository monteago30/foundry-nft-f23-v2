// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MainNft} from "../src/MainNft.sol";

contract DeployMainNft is Script {

    function run() external returns (MainNft) {
        vm.startBroadcast();
        MainNft mainNft = new MainNft();
        vm.stopBroadcast();
        return mainNft;
    }
}