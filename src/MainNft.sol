// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MainNft is ERC721 {
    uint256 private s_tokenTally;
    mapping(uint256 => string) private s_tokensIdToUri;
    constructor() ERC721("Pooch", "PUP") {
        s_tokenTally = 0;
    }

    function createNft(string memory tokenUri) public {
        s_tokensIdToUri[s_tokenTally] = tokenUri;
        _safeMint(msg.sender, s_tokenTally);

        s_tokenTally++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokensIdToUri[tokenId];
    }
}