// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

interface INameRegistry {
    function nameExist(string calldata _name) external payable returns (bool);
}
