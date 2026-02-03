local template = require("nightfox.util.template")

local M = {}

function M.generate(spec, _)
  local content = [[
# Nightfox color scheme for Sway
## name: ${palette.meta.name}
## upstream: ${palette.meta.url}

# Background
set $bg0     ${bg0}
set $bg1     ${bg1}
set $bg2     ${bg2}
set $bg3     ${bg3}
set $bg4     ${bg4}

# Foreground
set $fg0     ${fg0}
set $fg1     ${fg1}
set $fg2     ${fg2}
set $fg3     ${fg3}

# Selection
set $sel0    ${sel0}
set $sel1    ${sel1}

# Accents
set $red     ${palette.red}
set $green   ${palette.green}
set $yellow  ${palette.yellow}
set $blue    ${palette.blue}
set $magenta ${palette.magenta}
set $cyan    ${palette.cyan}
set $orange  ${palette.orange}
set $pink    ${palette.pink}

# Dimmed accents
set $blue_dim ${palette.blue.dim}
set $magenta_dim ${palette.magenta.dim}

# Window colors
#                       border    background  text  indicator   child_border
client.focused          $blue_dim $blue_dim   $fg1  $sel1       $blue_dim
client.focused_inactive $bg3      $bg2        $fg3  $bg3        $bg3
client.unfocused        $bg2      $bg1        $fg3  $bg2        $bg2
client.urgent           $red      $bg1        $fg0  $red        $red
client.placeholder      $bg1      $bg0        $fg3  $bg1        $bg1
client.background       $bg0
]]

  return template.parse_template_str(content, spec)
end

return M
