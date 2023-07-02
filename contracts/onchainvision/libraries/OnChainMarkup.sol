// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

library OnChainMarkup {
    function style(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<style ", params, ">", content, "</style>")
            );
    }

    function text(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(abi.encodePacked("<text ", params, ">", content, "</text>"));
    }

    function svg(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(abi.encodePacked("<svg ", params, ">", content, "</svg>"));
    }

    function image(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<image ", params, ">", content, "</image>")
            );
    }

    function desc(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(abi.encodePacked("<desc ", params, ">", content, "</desc>"));
    }

    function video(
        uint256 src,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    '<svg xmlns="http://www.w3.org/2000/svg" xmlns:html="http://www.w3.org/1999/xhtml"><html:video src="',
                    src,
                    'file.mp4" controls="controls" ',
                    params,
                    "></html:video></svg>"
                )
            );
    }

    function a(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return string(abi.encodePacked("<a ", params, ">", content, "</a>"));
    }

    function audio(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<audio ", params, ">", content, "</audio>")
            );
    }

    function canvas(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<canvas ", params, ">", content, "</canvas>")
            );
    }

    function circle(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<circle ", params, ">", content, "</circle>")
            );
    }

    function ellipse(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<ellipse ",
                    params,
                    ">",
                    content,
                    "</ellipse>"
                )
            );
    }

    function foreignObject(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<foreignObject ",
                    params,
                    ">",
                    content,
                    "</foreignObject>"
                )
            );
    }

    function g(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return string(abi.encodePacked("<g ", params, ">", content, "</g>"));
    }

    function iframe(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<iframe ", params, ">", content, "</iframe>")
            );
    }

    function line(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(abi.encodePacked("<line ", params, ">", content, "</line>"));
    }

    function path(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(abi.encodePacked("<path ", params, ">", content, "</path>"));
    }

    function polygon(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<polygon ",
                    params,
                    ">",
                    content,
                    "</polygon>"
                )
            );
    }

    function polyline(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<polyline ",
                    params,
                    ">",
                    content,
                    "</polyline>"
                )
            );
    }

    function rect(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(abi.encodePacked("<rect ", params, ">", content, "</rect>"));
    }

    function switchElement(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<switch ", params, ">", content, "</switch>")
            );
    }

    function textPath(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<textPath ",
                    params,
                    ">",
                    content,
                    "</textPath>"
                )
            );
    }

    function tspan(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<tspan ", params, ">", content, "</tspan>")
            );
    }

    function unknown(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<unknown ",
                    params,
                    ">",
                    content,
                    "</unknown>"
                )
            );
    }

    function use(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(abi.encodePacked("<use ", params, ">", content, "</use>"));
    }

    function symbol(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<symbol ", params, ">", content, "</symbol>")
            );
    }

    function clipPath(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<clipPath ",
                    params,
                    ">",
                    content,
                    "</clipPath>"
                )
            );
    }

    function defs(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(abi.encodePacked("<defs ", params, ">", content, "</defs>"));
    }

    function linearGradient(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<linearGradient ",
                    params,
                    ">",
                    content,
                    "</linearGradient>"
                )
            );
    }

    function marker(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<marker ", params, ">", content, "</marker>")
            );
    }

    function mask(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(abi.encodePacked("<mask ", params, ">", content, "</mask>"));
    }

    function metadata(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<metadata ",
                    params,
                    ">",
                    content,
                    "</metadata>"
                )
            );
    }

    function pattern(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<pattern ",
                    params,
                    ">",
                    content,
                    "</pattern>"
                )
            );
    }

    function radialGradient(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "<radialGradient ",
                    params,
                    ">",
                    content,
                    "</radialGradient>"
                )
            );
    }

    function script(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<script ", params, ">", content, "</script>")
            );
    }

    function title(
        uint256 content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<title ", params, ">", content, "</title>")
            );
    }
}
