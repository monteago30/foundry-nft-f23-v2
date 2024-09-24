// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract ChangeMoodNft is ERC721, Ownable {
    // errors
    error ChangeMoodNft__CantChangeTheMoodIfNotOwner();

    uint256 private s_tokenMarker;
    string private s_depressedSvgImageUri;
    string private s_jollySvgImageUri;

    enum ChangeMood {
        DEPRESSED,
        JOLLY
    }

    mapping(uint256 => ChangeMood) private s_tokenIdToChangeMood;

    constructor(
        string memory depressedSvgImageUri, 
        string memory jollySvgImageUri
    ) ERC721("Change Mood NFT", "CMN") Ownable(msg.sender) {
        s_tokenMarker = 0;
        s_depressedSvgImageUri = depressedSvgImageUri;
        s_jollySvgImageUri = jollySvgImageUri;
    }

    function createNft() public {
        _safeMint(msg.sender, s_tokenMarker);
        s_tokenIdToChangeMood[s_tokenMarker] = ChangeMood.JOLLY;
        s_tokenMarker++;
    }

    function flipTheNftMood(uint256 tokenId) public {
        // Only want the NFT owner to be able to change the mood
        if (getApproved(tokenId) != msg.sender && ownerOf(tokenId) != msg.sender) {
            revert ChangeMoodNft__CantChangeTheMoodIfNotOwner();
        }
        if (s_tokenIdToChangeMood[tokenId] == ChangeMood.JOLLY) {
            s_tokenIdToChangeMood[tokenId] = ChangeMood.DEPRESSED;
        } else {
            s_tokenIdToChangeMood[tokenId] = ChangeMood.JOLLY;
        }
    } 

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;
        if(s_tokenIdToChangeMood[tokenId] == ChangeMood.JOLLY) {
            imageURI = s_jollySvgImageUri;
        } else {
            imageURI = s_depressedSvgImageUri;
        }

        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"', 
                            name(), 
                            '", "description": "An NFT that reflects the owners mood. 100% on Chain!", ', 
                            '"attributes": [{"trait_type": "moodines", "value": "100"}], "image": "', 
                            imageURI, '"}'
                            // string memory tokenMatadata = abi.encodePacked('{"name": "', name(), '"}');
                        )
                    )
                )
            )
        );
    }
}