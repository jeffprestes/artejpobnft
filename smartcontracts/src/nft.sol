/*
SPDX-License-Identifier: UNLICENSED
(c) Desenvolvido por Jeff Prestes
*/

pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract JPOBNFTs is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("JPOBNFTs", "AJPOBNFT") {}

    function geraToken(address _cliente, string memory _urlMetadadoToken)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _safeMint(_cliente, newItemId);
        _setTokenURI(newItemId, _urlMetadadoToken);
        return newItemId;
    }    

    function alteraUriToken(uint256 _tokenId, string memory _urlMetadadoToken)
        public
        onlyOwner
        returns (bool)
    {
        _setTokenURI(_tokenId, _urlMetadadoToken);
        return true;
    }
}