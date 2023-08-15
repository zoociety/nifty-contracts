# OnChainVision - Transforming Blockchain Tokens into Engaging Experiences

**OnChainVision** is a comprehensive suite of libraries, tools, and frameworks that empower developers/creators to design and develop next-generation on-chain assets, that is _visually appealing, dynamic, and interactive_! The project provides a rich set of features and functionalities for generating interactive tokens, incorporating dynamic metadata, and creating visually engaging on-chain visuals. Its offers a user-friendly interface and extensive documentation to simplify the development process and enable seamless integration with existing blockchain platforms and token standards.

## Our Goals

- Empower Developers: OnChainVision aims to provide developers with a comprehensive set of tools and libraries to create innovative on-chain assets effortlessly. It strives to lower the barriers to entry and enable developers of all skill levels to explore the potential of interactive tokens.

- Enhance User Experience: We seeks to deliver a captivating and engaging user experience by incorporating dynamic metadata and visually appealing on-chain images. It aspires to make on-chain assets more interactive, visually stunning, and memorable for users.

- Foster Innovation: By offering a platform for experimentation and creativity, we encourages developers, artists, and creators to push the boundaries of what is possible with on-chain assets. It aims to foster a thriving ecosystem of innovative token designs and interactive experiences.

- Promote Adoption: We strives to drive the adoption of interactive tokens across industries by showcasing the potential and value they bring to various use cases. It aims to collaborate with partners, developers, and blockchain communities to promote the benefits of interactive on-chain assets.

_OnChainVision is a pioneering project that aims to transform the landscape of on-chain assets by introducing interactivity, dynamic metadata, and visually captivating experiences for token holders. With a vision to redefine the token experience and goals to empower developers, enhance user experience, foster innovation, and promote adoption, OnChainVision is poised to shape the future of interactive tokens in the blockchain ecosystem._

## On-Chain Visual Graphics (OCVG) Library

Welcome to the On-Chain Visual Graphics (OCVG) Library! 🚀

### Overview

OCVG is a comprehensive and powerful contract library designed to enable developers and creators to build visually appealing and interactive on-chain graphics and visual elements for decentralized applications (DApps) and Non-Fungible Token (NFT) projects. With OCVG, you can unlock the full potential of your blockchain-based assets and bring them to life with stunning visual experiences!

### Features

- Interactive Graphics: OCVG provides a wide range of functions and tools for creating interactive on-chain graphics. From dynamic animations to responsive visual elements, you can design captivating user experiences.

- SVG Generation: The library offers seamless SVG generation capabilities, allowing you to create scalable vector graphics directly on the blockchain. SVGs are highly versatile and compatible with various platforms.

- Customizable Styles: Customize the appearance of your on-chain graphics with ease. OCVG supports various styling options, enabling you to match your visual elements to your project's unique branding.

- Intuitive API: OCVG comes with an intuitive and developer-friendly API, making it simple to integrate the library into your smart contracts and DApps.

- Extensive Documentation: You'll find detailed documentation and code examples to guide you through the implementation of OCVG in your projects.

### Installation

To use the OCVG Library in your Ethereum smart contracts on Remix, simply import it in your Solidity code:

```bash
import "@zoociety/nifty-contracts/contracts/onchainvision/libraries/OCVG.sol";
```

### Getting Started

Follow these steps to start using OCVG in your hardhat project:

- Install the package `npm install @zoociety/nifty-contracts`.

- Import the OCVG Library `import "@zoociety/nifty-contracts/contracts/onchainvision/libraries/OCVG.sol";`.

- Begin creating your on-chain visual graphic design with the provided functions and tools.

### Code Examples

Example: Creating a vector image with centered text on green background with "Hello, OCVG" title

```bash
import "@zoociety/nifty-contracts/contracts/onchainvision/libraries/OCVG.sol";

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
