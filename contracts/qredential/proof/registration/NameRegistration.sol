// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ProofOfNameRegistration is
    ERC721("Qredential: Proof of Registration", "PONR")
{
    uint256 tokenIds;

    constructor() {}

    mapping(uint256 => string) nameIDs;
    mapping(uint256 => address) issuers;
    mapping(uint256 => address) issuedTo;
    mapping(address => uint256[]) ownedTokens;

    function version() public pure returns (string memory) {
        return "Qredential V1";
    }

    function issueProof(
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
}
