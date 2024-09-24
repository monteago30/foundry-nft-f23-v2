// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {ChangeMoodNft} from "../src/ChangeMoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployChangeMoodNft is Script {
    uint256 public DEFAULT_ANVIL_KEY = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
    function run() external returns (ChangeMoodNft) {
        string memory depressedSvg = vm.readFile("./img/depressed.svg");
        string memory jollySvg = vm.readFile("./img/jolly.svg");
        // console.log(depressedSvg);

        vm.startBroadcast();
        ChangeMoodNft changeMoodNft = new ChangeMoodNft(
            svgToImageURI(depressedSvg),
            svgToImageURI(jollySvg)
        );
        vm.stopBroadcast();
        return changeMoodNft;
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        // example:
        // <svg viewBox="0 0 200 200" width="400"  height="400" .....>
        // data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIw.....
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}