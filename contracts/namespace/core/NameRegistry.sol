// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "../../qredential/proof/registration/NameRegistration.sol";
import "../interfaces/INameRegistry.sol";
import "./NamespaceHandle.sol";

/// @title Blockchain Name Registrar
/// @author raldblox | zoociety | chaintelliq
/// @notice Stores all records associated with blockchain names
/// @dev The Core of Blockchain Names

contract NameRegistry {
    address public admin;
    uint256 public namingFee;

    // @note Registration Process
    // 1. Check if name is owned
    // 2. Migrate data from one name to another; with 2FA Verification

    struct Name {
        string[] names;
        mapping(string => uint256) nameIds;
        mapping(string => uint256) proofIds;
        mapping(string => uint256) isVisible;
        mapping(string => bool) withPendingTransferData;
        mapping(string => address) registrants;
        mapping(string => string[]) connectedSpaces;
        mapping(string => mapping(address => string[])) profiles; // map profiles to name and wallet address (msg.sender/nameowner)
        mapping(string => mapping(address => string[])) textRecords; // map text records to name and wallet address (msg.sender/nameowner)
        mapping(string => mapping(address => address)) addressRecords; // map wallet addresses to name and wallet address (msg.sender/nameowner)
    }

    ProofOfNameRegistration public qredential;
    NamespaceHandle public handle;

    Name private names;
    mapping(address => string) primaryNames; // @note priority names; sets above all names

    constructor() {
        admin = msg.sender;
        qredential = new ProofOfNameRegistration();
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

    function registerName(
        string calldata _name,
        address _owner
    ) public payable returns (bool) {
        require(_owner != address(0), "Owner cannot be zero");
        require(names.registrants[_name] == address(0));
        if (!isAdmin()) {
            require(msg.value >= namingFee, "Name creation fee not met");
        }
        uint256 proofId = qredential.issueProof(_name, _owner); // @note soul-bound token
        uint256 nameId = handle.createHandle(_name, _owner); // @note transferrable token
        names.names.push(_name);
        names.proofIds[_name] = proofId;
        names.nameIds[_name] = nameId;
        names.registrants[_name] = _owner;
        return true;
    }

    function getRegistrant(string memory _name) public view returns (address) {
        return names.registrants[_name];
    }

    function nameExist(string memory _name) public view returns (bool) {
        return names.registrants[_name] != address(0);
    }
}
