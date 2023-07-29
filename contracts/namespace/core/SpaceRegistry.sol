// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "../../qredential/proof/registration/SpaceRegistration.sol";
import "./NamespaceFactory.sol";
import "../interfaces/ISpaceRegistry.sol";

contract SpaceRegistry {
    // 1. Check if space is blacklisted
    // 2. Check if space is not owned
    // 3. Register and Create NFT Collection

    address public admin;
    uint256 public namingFee;
    address private nameRegistry;

    // @note Registration Process
    // 1. Check if name is owned
    // 2. Migrate data from one name to another; with 2FA Verification

    struct Space {
        string[] spaces;
        mapping(string => uint256) spaceIds;
        mapping(string => address) spaceAddresses;
        mapping(string => uint256) isVisible;
        mapping(string => bool) withPendingTransferData;
        mapping(string => address) registrants;
        mapping(string => string[]) connectedNames;
        mapping(string => mapping(address => string[])) profiles; // map profiles to name and wallet address (msg.sender/nameowner)
        mapping(string => mapping(address => string[])) textRecords; // map text records to name and wallet address (msg.sender/nameowner)
        mapping(string => mapping(address => address)) addressRecords; // map wallet addresses to name and wallet address (msg.sender/nameowner)
    }

    ProofOfSpaceRegistration public qredential;

    Space private spaces;
    mapping(address => string) primaryNames; // @note priority names; sets above all names

    constructor(address _nameRegistry) {
        admin = msg.sender;
        qredential = new ProofOfSpaceRegistration();
        nameRegistry = _nameRegistry;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Caller is not the admin");
        _;
    }

    function isAdmin() internal view returns (bool) {
        return admin == msg.sender;
    }

    function viewAdmin() public view returns (address) {
        return address(admin);
    }

    function viewQredential() public view returns (string memory) {
        return qredential.version();
    }

    function registerSpace(
        string calldata _name,
        address _owner
    ) public payable returns (bool) {
        require(_owner != address(0), "Owner cannot be zero");
        require(spaces.registrants[_name] == address(0));
        if (!isAdmin()) {
            require(msg.value >= namingFee, "Name creation fee not met");
        }
        string memory collectionName = _name;
        NamespaceFactory newSpaceCollection;
        newSpaceCollection = new NamespaceFactory(
            collectionName,
            "NST",
            msg.sender,
            address(this),
            nameRegistry
        );
        uint256 tokenId = qredential.issueProof(_name, _owner);
        spaces.spaces.push(_name);
        spaces.spaceIds[_name] = tokenId;
        spaces.spaceAddresses[_name] = address(newSpaceCollection);
        spaces.registrants[_name] = _owner;
        return true;
    }

    function getRegistrant(string memory _name) public view returns (address) {
        return spaces.registrants[_name];
    }

    function getSpaceAddress(
        string memory _name
    ) public view returns (address) {
        return spaces.spaceAddresses[_name];
    }

    function spaceExist(string memory _name) public view returns (bool) {
        return spaces.registrants[_name] != address(0);
    }
}
