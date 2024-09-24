// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {MainNft} from "../src/MainNft.sol";


contract CreateMainNft is Script {
    string public constant SHIBAINU = "ipfs://QmdpEb6rK4GDT4uAZGzY81NgfevFNpLVA5ZCuMcbzRaSvE/2.json";
    function run() external {
        address mostNewestDeployed = DevOpsTools.get_most_recent_deployment("MainNft", block.chainid);
        createNftOnContract(mostNewestDeployed);
    }

    function createNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MainNft(contractAddress).createNft(SHIBAINU);
        vm.stopBroadcast();
    }
}