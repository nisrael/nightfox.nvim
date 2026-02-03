local template = require("nightfox.util.template")

local M = {}

function M.generate(spec, _)
  local content = [[
/**
 * Nightfox colors for Waybar
 * name: ${palette.meta.name}
 * upstream: ${palette.meta.url}
 */

@define-color rosewater ${palette.pink};
@define-color flamingo ${palette.orange};
@define-color pink ${palette.pink};
@define-color mauve ${palette.magenta};
@define-color red ${palette.red};
@define-color maroon ${palette.red};
@define-color peach ${palette.orange};
@define-color yellow ${palette.yellow};
@define-color green ${palette.green};
@define-color teal ${palette.cyan};
@define-color sky ${palette.cyan};
@define-color sapphire ${palette.blue};
@define-color blue ${palette.blue};
@define-color lavender ${palette.magenta};
@define-color text ${fg1};
@define-color subtext1 ${fg1};
@define-color subtext0 ${fg2};
@define-color overlay2 ${fg3};
@define-color overlay1 ${bg4};
@define-color overlay0 ${bg3};
@define-color surface2 ${sel0};
@define-color surface1 ${bg2};
@define-color surface0 ${bg1};
@define-color base ${bg1};
@define-color mantle ${bg0};
@define-color crust ${bg0};
]]

  return template.parse_template_str(content, spec)
end

return M
