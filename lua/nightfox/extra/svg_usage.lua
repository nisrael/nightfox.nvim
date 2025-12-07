local template = require("nightfox.util.template")

local M = {}

function M.generate(spec, _)
  local pal = spec.palette
  local name = pal.meta.name
  spec.title = name:sub(1, 1):upper() .. name:sub(2) .. " Color Usage"

  -- Helper function to extract hex value from Shade objects
  local function hex(color)
    if type(color) == "table" and color.base then
      return color.base
    end
    return color
  end

  local content = [===[<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
   viewBox="0 0 793.70179 1122.5211"
   width="210mm"
   height="297mm"
   version="1.1"
   id="svg134"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  <defs
     id="defs1" />
  <style
     id="style1">
        .swatch {
        stroke: ${bg1};
        stroke-width: 2;
        }

        .label {
        font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
        font-size: 12px;
        fill: ${fg1};
        }

        .title {
        font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
        font-size: 24px;
        font-weight: bold;
        fill: ${palette.fg1};
        }

        .section-title {
        font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
        font-size: 16px;
        font-weight: bold;
        fill: ${palette.blue.base};
        }

        .hex-label {
        font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
        font-size: 10px;
        fill: ${fg2};
        }
    </style>
  <rect
     width="793.70081"
     height="1122.4052"
     fill="${bg1}"
     id="rect30-6"
     x="-1.5915471e-09"
     y="1.1848962e-07"
     style="stroke-width:0.5669" />
  <text
     x="396.68604"
     y="32.068722"
     text-anchor="middle"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="19.2412px"
     font-weight="bold"
     fill="${fg0}"
     id="text93"
     style="text-align:center;text-anchor:middle;stroke-width:0.801718">${title}</text>
  <text
     x="40.085938"
     y="72.154617"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="12.8275px"
     font-weight="bold"
     fill="${fg0}"
     id="text94"
     style="stroke-width:0.801718">Syntax Highlighting</text>
  <rect
     x="40.085938"
     y="88.188972"
     width="48.103077"
     height="24.051538"
     fill="${syntax.bracket}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect94" />
  <text
     x="96.835579"
     y="109.22978"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text71-9"
     style="stroke-width:0.801718"><tspan
       id="tspan4"
       x="96.835579"
       y="109.22978">${syntax.bracket}</tspan></text>
  <text
     x="96.206123"
     y="98.092606"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text95"
     style="stroke-width:0.801718"><tspan
       id="tspan2"
       x="96.206123"
       y="98.092606">bracket - Brackets and Punctuation</tspan></text>
  <rect
     x="40.085938"
     y="120.25768"
     width="48.103077"
     height="24.051538"
     fill="${palette.red.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect95" />
  <text
     x="96.206123"
     y="129.71701"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text96"
     style="stroke-width:0.801718">builtin0 - Builtin variable</text>
  <text
     x="96.206123"
     y="141.74278"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text96b"
     style="stroke-width:0.801718">${palette.red.base}</text>
  <rect
     x="40.085938"
     y="152.32642"
     width="48.103077"
     height="24.051538"
     fill="${syntax.builtin1}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect96" />
  <text
     x="96.206123"
     y="161.77402"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text97"
     style="stroke-width:0.801718">builtin1 - Builtin type</text>
  <text
     x="96.206123"
     y="173.79979"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text97b"
     style="stroke-width:0.801718">${syntax.builtin1}</text>
  <rect
     x="40.085938"
     y="184.39514"
     width="48.103077"
     height="24.051538"
     fill="${syntax.builtin2}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect97" />
  <text
     x="96.206123"
     y="193.84274"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text98"
     style="stroke-width:0.801718">builtin2 - Builtin const</text>
  <text
     x="96.206123"
     y="205.8685"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text98b"
     style="stroke-width:0.801718">${syntax.builtin2}</text>
  <rect
     x="40.085938"
     y="216.46387"
     width="48.103077"
     height="24.051538"
     fill="${palette.comment}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect98" />
  <text
     x="96.206123"
     y="225.6554"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text99"
     style="stroke-width:0.801718">comment - Comment</text>
  <text
     x="96.206123"
     y="237.68126"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text99b"
     style="stroke-width:0.801718">${palette.comment}</text>
  <rect
     x="40.085938"
     y="248.53258"
     width="48.103077"
     height="24.051538"
     fill="${syntax.conditional}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect99" />
  <text
     x="96.206123"
     y="257.99185"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text100"
     style="stroke-width:0.801718">conditional - Conditional and loop</text>
  <text
     x="96.206123"
     y="270.01773"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text100b"
     style="stroke-width:0.801718">${syntax.conditional}</text>
  <rect
     x="40.085938"
     y="280.60132"
     width="48.103077"
     height="24.051538"
     fill="${syntax.builtin2}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect100" />
  <text
     x="96.206123"
     y="290.04886"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text101"
     style="stroke-width:0.801718">const - Constants, imports, booleans</text>
  <text
     x="96.206123"
     y="302.07474"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text101b"
     style="stroke-width:0.801718">${syntax.builtin2}</text>
  <rect
     x="40.085938"
     y="312.67004"
     width="48.103077"
     height="24.051538"
     fill="${palette.blue.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect101" />
  <text
     x="96.087837"
     y="333.39301"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text101b-9"
     style="stroke-width:0.801718">${palette.blue.base}</text>
  <text
     x="96.206123"
     y="322.89148"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text102"
     style="stroke-width:0.801718">field - Field</text>
  <rect
     x="40.085938"
     y="344.73874"
     width="48.103077"
     height="24.051538"
     fill="${syntax.func}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect102" />
  <text
     x="96.206123"
     y="354.18628"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text103"
     style="stroke-width:0.801718">func - Functions and Titles</text>
  <text
     x="96.206123"
     y="366.21216"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text103b"
     style="stroke-width:0.801718">${syntax.func}</text>
  <rect
     x="40.085938"
     y="376.80746"
     width="48.103077"
     height="24.051538"
     fill="${syntax.ident}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect103" />
  <text
     x="96.206123"
     y="386.255"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text104"
     style="stroke-width:0.801718">ident - Identifiers</text>
  <text
     x="96.206123"
     y="398.28088"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text104b"
     style="stroke-width:0.801718">${syntax.ident}</text>
  <rect
     x="40.085938"
     y="408.87619"
     width="48.103077"
     height="24.051538"
     fill="${syntax.keyword}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect104" />
  <text
     x="96.206123"
     y="418.32373"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text105"
     style="stroke-width:0.801718">keyword - Keywords</text>
  <text
     x="96.206123"
     y="430.34961"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text105b"
     style="stroke-width:0.801718">${syntax.keyword}</text>
  <rect
     x="40.085938"
     y="440.94492"
     width="48.103077"
     height="24.051538"
     fill="${palette.orange.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect105" />
  <text
     x="96.206123"
     y="450.40417"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text106"
     style="stroke-width:0.801718">number - Numbers</text>
  <text
     x="96.206123"
     y="462.43005"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text106b"
     style="stroke-width:0.801718">${palette.orange.base}</text>
  <rect
     x="40.085938"
     y="473.01364"
     width="48.103077"
     height="24.051538"
     fill="${fg2}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect106" />
  <rect
     x="40.085938"
     y="505.08237"
     width="48.103077"
     height="24.051538"
     fill="${syntax.preproc}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect107" />
  <rect
     x="40.085938"
     y="537.15112"
     width="48.103077"
     height="24.051538"
     fill="${syntax.regex}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect108" />
  <text
     x="95.280708"
     y="546.28156"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text109"
     style="stroke-width:0.801718">regex - Regex</text>
  <text
     x="96.206123"
     y="558.30743"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text109b"
     style="stroke-width:0.801718">${syntax.regex}</text>
  <rect
     x="40.085938"
     y="569.21979"
     width="48.103077"
     height="24.051538"
     fill="${palette.green.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect109" />
  <text
     x="96.069893"
     y="578.67902"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text110"
     style="stroke-width:0.801718">string - Strings</text>
  <text
     x="96.643013"
     y="590.7049"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text110b"
     style="stroke-width:0.801718">${palette.green.base}</text>
  <rect
     x="40.085938"
     y="601.28851"
     width="48.103077"
     height="24.051538"
     fill="${palette.yellow.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect110" />
  <rect
     x="40.085938"
     y="633.35724"
     width="48.103077"
     height="24.051538"
     fill="${syntax.variable}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect111" />
  <text
     x="40.085938"
     y="689.47754"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="12.8275px"
     font-weight="bold"
     fill="${fg0}"
     id="text113"
     style="stroke-width:0.801718">Diagnostics</text>
  <rect
     x="40.085938"
     y="705.51184"
     width="48.103077"
     height="24.051538"
     fill="${palette.red.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect113" />
  <text
     x="96.206123"
     y="714.07385"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text114"
     style="stroke-width:0.801718">error</text>
  <text
     x="96.206123"
     y="726.09973"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text114b"
     style="stroke-width:0.801718">${palette.red.base}</text>
  <rect
     x="280.6012"
     y="705.51184"
     width="48.103077"
     height="24.051538"
     fill="${palette.yellow.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect114" />
  <text
     x="336.72144"
     y="714.07385"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text115"
     style="stroke-width:0.801718">warn</text>
  <text
     x="336.72144"
     y="726.09973"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text115b"
     style="stroke-width:0.801718">${palette.yellow.base}</text>
  <rect
     x="40.085938"
     y="737.58057"
     width="48.103077"
     height="24.051538"
     fill="${palette.blue.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect115" />
  <text
     x="96.206123"
     y="747.03979"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text116"
     style="stroke-width:0.801718">info</text>
  <text
     x="96.206123"
     y="759.06567"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text116b"
     style="stroke-width:0.801718">${palette.blue.base}</text>
  <rect
     x="280.6012"
     y="737.58057"
     width="48.103077"
     height="24.051538"
     fill="${palette.green.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect116" />
  <text
     x="336.72144"
     y="747.03979"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text117"
     style="stroke-width:0.801718">hint</text>
  <text
     x="336.72144"
     y="759.06567"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text117b"
     style="stroke-width:0.801718">${palette.green.base}</text>
  <rect
     x="521.11658"
     y="737.58057"
     width="48.103077"
     height="24.051538"
     fill="${palette.green.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect117" />
  <text
     x="577.23682"
     y="747.03979"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text118"
     style="stroke-width:0.801718">ok</text>
  <text
     x="577.23682"
     y="759.06567"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text118b"
     style="stroke-width:0.801718">${palette.green.base}</text>
  <text
     x="40.085938"
     y="793.70081"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="12.8275px"
     font-weight="bold"
     fill="${fg0}"
     id="text119"
     style="stroke-width:0.801718">Git Status</text>
  <rect
     x="40.085938"
     y="809.73517"
     width="48.103077"
     height="24.051538"
     fill="${palette.green.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect119" />
  <text
     x="96.206123"
     y="819.1944"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text120"
     style="stroke-width:0.801718">add</text>
  <text
     x="96.206123"
     y="831.22028"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text120b"
     style="stroke-width:0.801718">${palette.green.base}</text>
  <rect
     x="280.6012"
     y="809.73517"
     width="48.103077"
     height="24.051538"
     fill="${palette.red.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect120" />
  <text
     x="336.72144"
     y="819.1944"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text121"
     style="stroke-width:0.801718">removed</text>
  <text
     x="336.72144"
     y="831.22028"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text121b"
     style="stroke-width:0.801718">${palette.red.base}</text>
  <rect
     x="40.085938"
     y="841.80389"
     width="48.103077"
     height="24.051538"
     fill="${palette.yellow.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect121" />
  <text
     x="96.206123"
     y="851.26312"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text122"
     style="stroke-width:0.801718">changed</text>
  <text
     x="96.206123"
     y="863.289"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text122b"
     style="stroke-width:0.801718">${palette.yellow.base}</text>
  <rect
     x="280.6012"
     y="841.80389"
     width="48.103077"
     height="24.051538"
     fill="${palette.orange.base}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect122" />
  <text
     x="336.72144"
     y="851.26312"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text123"
     style="stroke-width:0.801718">conflict</text>
  <text
     x="336.72144"
     y="863.289"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text123b"
     style="stroke-width:0.801718">${palette.orange.base}</text>
  <rect
     x="521.11658"
     y="841.80389"
     width="48.103077"
     height="24.051538"
     fill="${palette.comment}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect123" />
  <text
     x="577.23682"
     y="851.26312"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text124"
     style="stroke-width:0.801718">ignored</text>
  <text
     x="577.23682"
     y="863.289"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text124b"
     style="stroke-width:0.801718">${palette.comment}</text>
  <text
     x="40.085938"
     y="897.92413"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="12.8275px"
     font-weight="bold"
     fill="${fg0}"
     id="text125"
     style="stroke-width:0.801718">Diff Backgrounds</text>
  <rect
     x="40.085938"
     y="913.9585"
     width="64.137436"
     height="24.051538"
     fill="${diff.add}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect125" />
  <text
     x="112.24043"
     y="923.41772"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text126"
     style="stroke-width:0.801718">add</text>
  <text
     x="112.24043"
     y="935.4436"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text126b"
     style="stroke-width:0.801718">${diff.add}</text>
  <rect
     x="320.68701"
     y="913.9585"
     width="64.137436"
     height="24.051538"
     fill="${diff.delete}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect126" />
  <text
     x="392.84167"
     y="923.41772"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text127"
     style="stroke-width:0.801718">delete</text>
  <text
     x="392.84167"
     y="935.4436"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text127b"
     style="stroke-width:0.801718">${diff.delete}</text>
  <rect
     x="40.085938"
     y="946.02722"
     width="64.137436"
     height="24.051538"
     fill="${diff.change}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect127" />
  <text
     x="112.24043"
     y="955.48645"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text128"
     style="stroke-width:0.801718">change</text>
  <text
     x="112.24043"
     y="967.51233"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text128b"
     style="stroke-width:0.801718">${diff.change}</text>
  <rect
     x="320.68701"
     y="946.02722"
     width="64.137436"
     height="24.051538"
     fill="${diff.text}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect128" />
  <text
     x="392.84167"
     y="955.20459"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text129"
     style="stroke-width:0.801718">text</text>
  <text
     x="392.84167"
     y="967.23047"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text129b"
     style="stroke-width:0.801718">${diff.text}</text>
  <text
     x="40.085938"
     y="1002.1474"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="12.8275px"
     font-weight="bold"
     fill="${fg0}"
     id="text130"
     style="stroke-width:0.801718">Diagnostic Backgrounds</text>
  <rect
     x="40.085938"
     y="1018.182"
     width="64.137436"
     height="24.051538"
     fill="${diag_bg.error}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect130" />
  <text
     x="112.24043"
     y="1027.6294"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text131"
     style="stroke-width:0.801718">error bg</text>
  <text
     x="112.24043"
     y="1039.6553"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text131b"
     style="stroke-width:0.801718">${diag_bg.error}</text>
  <rect
     x="320.68701"
     y="1018.182"
     width="64.137436"
     height="24.051538"
     fill="${diag_bg.warn}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect131" />
  <text
     x="392.84167"
     y="1027.6412"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text132"
     style="stroke-width:0.801718">warn bg</text>
  <text
     x="392.84167"
     y="1039.6671"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text132b"
     style="stroke-width:0.801718">${diag_bg.warn}</text>
  <rect
     x="40.085938"
     y="1050.2504"
     width="64.137436"
     height="24.051538"
     fill="${diag_bg.info}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect132" />
  <text
     x="112.24043"
     y="1059.7097"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text133"
     style="stroke-width:0.801718">info bg</text>
  <text
     x="112.24043"
     y="1071.7356"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text133b"
     style="stroke-width:0.801718">${diag_bg.info}</text>
  <rect
     x="320.68701"
     y="1050.2504"
     width="64.137436"
     height="24.051538"
     fill="${diag_bg.hint}"
     stroke="${bg1}"
     stroke-width="1.60344"
     id="rect133" />
  <text
     x="392.84167"
     y="1059.7097"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text134"
     style="stroke-width:0.801718">hint bg</text>
  <text
     x="392.84167"
     y="1071.7356"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text134b"
     style="stroke-width:0.801718">${diag_bg.hint}</text>
  <text
     x="96.243706"
     y="482.20749"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text107"
     style="stroke-width:0.801718">operator - Operators</text>
  <text
     x="96.642998"
     y="494.22867"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text106b-7"
     style="stroke-width:0.801718">${fg2}</text>
  <text
     x="96.013535"
     y="514.17761"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text108"
     style="stroke-width:0.801718">preproc - PreProc</text>
  <text
     x="96.64299"
     y="526.27393"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text106b-1"
     style="stroke-width:0.801718">${syntax.preproc}</text>
  <text
     x="95.961845"
     y="610.45416"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text111"
     style="stroke-width:0.801718">type - Types</text>
  <text
     x="96.642998"
     y="622.50354"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text106b-5"
     style="stroke-width:0.801718">${palette.yellow.base}</text>
  <text
     x="96.530281"
     y="643.75598"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="9.62062px"
     fill="${fg1}"
     id="text112"
     style="stroke-width:0.801718">variable - Variables</text>
  <text
     x="96.643013"
     y="653.90283"
     font-family="Consolas, Monaco, 'Courier New', monospace"
     font-size="8.01718px"
     fill="${fg2}"
     id="text106b-77"
     style="stroke-width:0.801718">${syntax.variable}</text>
</svg>
]===]

  return template.parse_template_str(content, spec)
end

return M
