// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployMainNft} from "../script/DeployMainNft.s.sol";
import {MainNft} from "../src/MainNft.sol";

contract MainNftTest is Test {
    DeployMainNft public deployers;
    MainNft public mainNft;
    address public CUSTOMER = makeAddr("CUSTOMER");
    string public constant SHIBAINU = "ipfs://QmdpEb6rK4GDT4uAZGzY81NgfevFNpLVA5ZCuMcbzRaSvE/2.json";

    function setUp() public {
        deployers = new DeployMainNft();
        mainNft = deployers.run();
    }

    function testLabelIsTrue() public view {
        string memory predictName = "Pooch";
        string memory realName = mainNft.name();
        // Strings are array of bytes
        assert(keccak256(abi.encodePacked(predictName)) == keccak256(abi.encodePacked(realName)));
    }

    function testCanCreateAndHoldMoney() public {
        vm.prank(CUSTOMER);
        mainNft.createNft(SHIBAINU);

        assert(mainNft.balanceOf(CUSTOMER) == 1);
        assert(keccak256(abi.encodePacked(SHIBAINU)) == keccak256(abi.encodePacked(mainNft.tokenURI(0)))
        );
    }
}