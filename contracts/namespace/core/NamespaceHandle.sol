// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../utilities/NamespaceConnect.sol";

contract NamespaceHandle is ERC721("Namespace Handle", "NAME") {
    uint256 tokenIds;

    constructor() {}

    mapping(uint256 => string) nameIDs;
    mapping(uint256 => address) issuers;
    mapping(uint256 => address) issuedTo;
    mapping(address => uint256[]) ownedTokens;

    function createHandle(
        string memory _name,
        address _owner
    ) public returns (uint256) {
        uint256 newTokenId = tokenIds;
        tokenIds++;
        nameIDs[newTokenId] = _name;
        issuedTo[newTokenId] = _owner;
        issuers[newTokenId] = msg.sender;
        return newTokenId;
    }

    // 1. Check if name is owned
    // 2. Check if space exist
    // 3. Check if space has factory
    // 4. Connect and mint to Namespace Factory
}
