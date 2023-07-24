// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

library OCVG {
    function init(
        uint256 dimension,
        string memory params,
        string memory content,
        string memory bgcolor
    ) internal pure returns (string memory) {
        string memory doc = "svg";
        string memory dim = Strings.toString(dimension);
        string memory fill = string(
            abi.encodePacked(
                '<rect width="',
                dim,
                '" height="',
                dim,
                '" fill="',
                bgcolor,
                '" />'
            )
        );
        string memory xdim = string(
            abi.encodePacked(
                ' width="',
                dim,
                '" height="',
                dim,
                '" viewBox="0 0 ',
                dim,
                " ",
                dim,
                '" '
            )
        );
        string memory xmlms = ' xmlns="http://www.w3.org/2000/svg" ';
        string memory xlink = ' xmlns:xlink="http://www.w3.org/1999/xlink" >';
        return
            string(
                abi.encodePacked(
                    "<",
                    doc,
                    xdim,
                    xmlms,
                    params,
                    xlink,
                    fill,
                    content,
                    "</",
                    doc,
                    ">"
                )
            );
    }

    function iocvg(
        uint256 dimension,
        string memory params,
        string memory content,
        string memory background
    ) internal pure returns (string memory) {
        string memory dim = Strings.toString(dimension);
        string memory fill;
        return
            string(
                abi.encodePacked(
                    "<svg ",
                    'width="',
                    dim,
                    '" height="',
                    dim,
                    '" viewBox="0 0 ',
                    dim,
                    " ",
                    dim,
                    '"',
                    'fill= "',
                    background,
                    '" xmlns="http://www.w3.org/2000/svg"',
                    params,
                    'xmlns:xlink="http://www.w3.org/1999/xlink" >',
                    content,
                    "</svg>"
                )
            );
    }

    function encode(string memory data) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "data:image/svg+xml;base64,",
                    Base64.encode(bytes(data))
                )
            );
    }

    function style(
        string memory content,
        string memory params
    ) internal pure returns (string memory) {
        return
            string(
                abi.encodePacked("<style ", params, ">", content, "</style>")
            );
    }

    function text(
        uint256 x,
        uint256 y,
        uint256 fontSize,
        string memory anchor,
        string memory weight,
        string memory content,
        string memory color,
        string memory params
    ) internal pure returns (string memory) {
        string memory coordinate = string(
            abi.encodePacked(
                ' x="',
                Strings.toString(x),
                '" y="',
                Strings.toString(y),
                '"'
            )
        );
        string memory fontStyle = string(
            abi.encodePacked(
                ' fill="',
                color,
                '" font-size="',
                Strings.toString(fontSize),
                '" text-anchor="',
                anchor,
                '" font-weight="',
                weight,
                '"'
            )
        );
        string memory output = string(
            abi.encodePacked(
                "<text ",
                params,
                coordinate,
                fontStyle,
                ">",
                content,
                "</text>"
            )
        );
        return output;
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
