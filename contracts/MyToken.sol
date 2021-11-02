// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.22 <0.9.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"; 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MyToken is Ownable, ERC721URIStorage{

    using Counters for Counters.Counter; 
    Counters.Counter private _tokenIds;

    constructor () public ERC721("MyToken", "MT"){

    }

    function awardCollectible(address user, string memory tokenURI) public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _safeMint(user, newItemId);
        _setTokenURI(newItemId, tokenURI);
    
        return newItemId;
    }

}


 