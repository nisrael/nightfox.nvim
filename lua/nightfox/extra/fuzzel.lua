local template = require("nightfox.util.template")

local M = {}

local function conv(color)
  return color:gsub("^#", "")
end

local function construct(shade)
  return {
    base = conv(shade.base),
    bright = conv(shade.bright),
    dim = conv(shade.dim),
  }
end

function M.generate(spec, _)
  local p = spec.palette
  local colors = {
    meta = p.meta,
    bg1 = conv(spec.bg1),
    fg1 = conv(spec.fg1),
    fg2 = conv(spec.fg2),
    fg3 = conv(spec.fg3),
    sel0 = conv(spec.sel0),
    blue = construct(p.blue),
    cyan = construct(p.cyan),
  }

  local content = [[
[colors]
# Nightfox colors for Fuzzel
## name: ${meta.name}
## upstream: ${meta.url}

# Background colors (with transparency)
background=${bg1}e6
selection=${sel0}f2

# Text colors
text=${fg1}ff
selection-text=${fg1}ff
placeholder=${fg3}ff
prompt=${blue.base}ff
input=${fg1}ff
message=${fg1}ff
counter=${fg2}ff

# Match highlighting
match=${cyan.base}ff
selection-match=${cyan.base}ff

# Border
border=${blue.base}cc
]]

  return template.parse_template_str(content, colors)
end

return M
