// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {DeployChangeMoodNft} from "../../script/DeployChangeMoodNft.s.sol";

contract DeployChangeMoodNftTest is Test {
    DeployChangeMoodNft public deployer;

    function setUp() public {
        deployer = new DeployChangeMoodNft();
    }

    function testConvertingSvgToUri() public view {
        string memory predictedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4PSIwIiB5PSIxNSIgZmlsbD0iYmxhY2siPiBIaSEgWW91ciBicm93c2VyIGRlY29kZWQgdGhpcyEgPC90ZXh0Pjwvc3ZnPg==";
        string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="black"> Hi! Your browser decoded this! </text></svg>';
        string memory correctUri = deployer.svgToImageURI(svg);
        assert(keccak256(abi.encodePacked(correctUri)) == keccak256(abi.encodePacked(predictedUri)));
    }
}