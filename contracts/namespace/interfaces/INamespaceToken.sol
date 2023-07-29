// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

interface INamespaceToken {
    function createNameToken(
        string calldata _name
    ) external payable returns (bool);

    function createSpaceToken(
        string calldata _domain,
        string calldata _spacename,
        string calldata _description
    ) external payable returns (bool);

    function createNamespace(
        string calldata _name,
        string calldata _space
    ) external payable returns (bool);
}
