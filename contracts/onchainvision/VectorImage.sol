// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract OnChainVectorImage {
    struct VisualData {
        uint8 xDimension;
        uint8 yDimension;
        uint8 margin;
        mapping(uint256 => string) svgColor;
        mapping(uint256 => string) fontColor;
        mapping(uint256 => string) header;
        mapping(uint256 => string) footer;
        mapping(uint256 => string) center;
        mapping(uint256 => string) sidemark;
        mapping(uint256 => string) serial;
    }

    string uriPrefix = "data:image/svg+xml;base64,";

    VisualData public vision;

    uint256 squareDimension;

    constructor(uint8 _x, uint8 _y) {
        vision.xDimension = _x;
        vision.yDimension = _y;
    }

    function generateImage(
        uint256 tokenId
    ) public view returns (string memory) {
        string memory encodedBytes = Base64.encode(
            bytes(
                abi.encodePacked(
                    '<svg viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg">',
                    "<style>svg {background-color:#94ff2b;} text {fill:#131313;font-weight: bold; font-family: sans-serif;}</style>",
                    '<text x="480" y="50" font-size="30" text-anchor="end" font-weight="bold">(1)</text>'
                )
            )
        );
        return string(abi.encodePacked(uriPrefix, encodedBytes));
    }

    function generateStyle(
        uint256 tokenId
    ) public view returns (string memory) {
        string memory encodedBytes = Base64.encode(
            bytes(
                abi.encodePacked(
                    "<style>",
                    "svg {background-color:",
                    "#94ff2b",
                    ";} text {fill:",
                    "#131313",
                    ";font-weight: bold; ",
                    "font-family: sans-serif;}</style>"
                )
            )
        );
        return string(abi.encodePacked(uriPrefix, encodedBytes));
    }
}
