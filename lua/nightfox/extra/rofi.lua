local template = require("nightfox.util.template")

local M = {}

function M.generate(spec, _)
  local content = [===[
/**
 * Nightfox theme for rofi
 * name: ${palette.meta.name}
 * upstream: ${palette.meta.url}
 */

* {
    /* Color palette */
    bg0:     ${bg0};
    bg1:     ${bg1};
    bg2:     ${bg2};
    bg3:     ${bg3};
    bg4:     ${bg4};

    fg0:     ${fg0};
    fg1:     ${fg1};
    fg2:     ${fg2};
    fg3:     ${fg3};

    sel0:    ${sel0};
    sel1:    ${sel1};

    red:     ${palette.red};
    green:   ${palette.green};
    yellow:  ${palette.yellow};
    blue:    ${palette.blue};
    magenta: ${palette.magenta};
    cyan:    ${palette.cyan};
    orange:  ${palette.orange};
    pink:    ${palette.pink};

    /* Apply colors with transparency */
    background-color: ${bg1}e6;
    border-color:     ${palette.blue.base}cc;
    text-color:       @fg0;

    spacing: 0;
    margin: 0;
}

window {
    background-color: @background-color;
    border:           3px;
    border-color:     @border-color;
    border-radius:    6px;
    padding:          20px;
    width:            32%;
}

mainbox {
    spacing: 8px;
    children: [ inputbar, listview ];
}

inputbar {
    spacing: 8px;
    padding: 0px 0px 8px 0px;
    children: [ prompt, entry ];
}

prompt {
    text-color: @blue;
    vertical-align: 0.5;
}

entry {
    placeholder:       "Type to filter...";
    placeholder-color: @fg3;
    text-color:        @fg0;
}

listview {
    lines: 16;
    spacing: 2px;
    scrollbar: false;
}

element {
    padding: 8px 12px;
    border-radius: 4px;
}

element normal.normal {
    background-color: transparent;
    text-color:       @fg0;
}

element normal.active {
    background-color: transparent;
    text-color:       @cyan;
}

element normal.urgent {
    background-color: transparent;
    text-color:       @red;
}

element selected.normal {
    background-color: ${sel0}f2;
    text-color:       @fg0;
}

element selected.active {
    background-color: ${sel0}f2;
    text-color:       @cyan;
}

element selected.urgent {
    background-color: ${sel0}f2;
    text-color:       @red;
}

element-text {
    background-color: inherit;
    text-color:       inherit;
    vertical-align:   0.5;
}

element-icon {
    background-color: inherit;
    size:             1.5em;
    padding:          0px 8px 0px 0px;
}

message {
    padding: 8px;
    border-radius: 4px;
    background-color: @bg3;
}

textbox {
    text-color: @fg0;
}
]===]

  return template.parse_template_str(content, spec)
end

return M
