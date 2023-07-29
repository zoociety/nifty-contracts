// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ProofOfSpaceRegistration is
    ERC721("Qredential: Proof of Registration", "POSR")
{
    uint256 qredIds;

    constructor() {}

    function version() public pure returns (string memory) {
        return "Qredential V1";
    }

    function issueProof(
        string memory _name,
        address _owner
    ) public returns (uint256) {
        qredIds++;
        return qredIds;
    }
}
