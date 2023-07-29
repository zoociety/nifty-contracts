// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../utilities/NamespaceConnect.sol";
import "./NameRegistry.sol";
import "./SpaceRegistry.sol";

contract NamespaceFactory is ERC721 {
    address private owner;
    address private nameRegistry;
    address private spaceRegistry;

    constructor(
        string memory _space,
        string memory _symbol,
        address _owner,
        address _spaceRegistry,
        address _nameRegistry
    ) ERC721(_space, _symbol) {
        owner = _owner;
        spaceRegistry = _spaceRegistry;
        nameRegistry = _nameRegistry;
    }

    function createNamespace(string memory _name, string memory _space) public {
        require(
            NameRegistry(nameRegistry).nameExist(_name),
            "Name doesn't exist"
        );
        require(
            NameRegistry(nameRegistry).getRegistrant(_name) == msg.sender,
            "Name doesn't exist"
        );
    }

    // 1. Check if name is owned
    // 2. Check if space exist
    // 3. Check if space has factory
    // 4. Connect and mint to Namespace Factory
}
