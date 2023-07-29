// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "../libraries/OCVG.sol";

contract OnChainVectorImage {
    struct OnchainProperties {
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

    uint256 squareDimension;

    constructor() {}

    function generateImage(
        uint256 tokenId
    ) public view returns (string memory) {
        string memory content = generateDesign();
        string memory ocvg = OCVG.init(500, "", content, "green"); // @note creates 1000 x 1000 pts environment
        return OCVG.encode(ocvg);
    }

    function generateDesign() public pure returns (string memory) {
        // creates centered title
        string memory text = OCVG.text(
            250, // x-coordinate
            255, // y-coordinate
            50, // font size
            "middle", // alignment
            "bold", // alignment
            "hello", // font weight
            "white", // font color
            "" // extra params
        );

        return text;
    }

    function generateStyle() public pure returns (string memory) {
        string memory style = "";
        return style;
    }
}
