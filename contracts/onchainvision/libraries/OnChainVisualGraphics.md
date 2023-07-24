# On-Chain Visual Graphics (OCVG) Library

Welcome to the On-Chain Visual Graphics (OCVG) Library! 🚀

## Overview

OCVG is a comprehensive and powerful contract library designed to enable developers and creators to build visually appealing and interactive on-chain graphics and visual elements for decentralized applications (DApps) and Non-Fungible Token (NFT) projects. With OCVG, you can unlock the full potential of your blockchain-based assets and bring them to life with stunning visual experiences!

## Features

- Interactive Graphics: OCVG provides a wide range of functions and tools for creating interactive on-chain graphics. From dynamic animations to responsive visual elements, you can design captivating user experiences.

- SVG Generation: The library offers seamless SVG generation capabilities, allowing you to create scalable vector graphics directly on the blockchain. SVGs are highly versatile and compatible with various platforms.

- Customizable Styles: Customize the appearance of your on-chain graphics with ease. OCVG supports various styling options, enabling you to match your visual elements to your project's unique branding.

- Intuitive API: OCVG comes with an intuitive and developer-friendly API, making it simple to integrate the library into your smart contracts and DApps.

- Extensive Documentation: You'll find detailed documentation and code examples to guide you through the implementation of OCVG in your projects.

## Installation

To use the OCVG Library in your Ethereum smart contracts on Remix, simply import it in your Solidity code:

```bash
import "@zoociety/nifty-contracts/libraries/OCVG.so";
```

## Getting Started

Follow these steps to start using OCVG in your hardhat project:

- Install the package `npm install @zoociety/nifty-contracts`.

- Import the OCVG Library `import "@zoociety/nifty-contracts/libraries/OCVG.sol"`.

- Begin creating your on-chain visual graphic design with the provided functions and tools.

## Code Examples

Example: Creating a vector image with centered text on green background with "Hello, OCVG" title

```bash
import "@zoociety/nifty-contracts/libraries/OCVG.sol";

contract OnchainVisualNFT {

    constructor() {
    }

    function generateImage() public view returns (string memory) {
        string memory content = generateDesign();
        string memory ocvg = OCVG.init(100, "", content, "green"); // @note creates 1000 x 1000 pts environment
        return OCVG.encode(ocvg);
    }

    function generateDesign() public pure returns (string memory) {
        string memory text = OCVG.text(
            50, // x-coordinate
            55, // y-coordinate
            15, // font size
            "middle", // alignment
            "bold", // font weight
            "Hello, OCVG", // text
            "white", // font color
            "" // extra params
        );
        return text;
    }

}
```
