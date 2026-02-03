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
    bg0 = conv(spec.bg0),
    bg1 = conv(spec.bg1),
    bg3 = conv(spec.bg3),
    fg1 = conv(spec.fg1),
    fg3 = conv(spec.fg3),
    red = construct(p.red),
    yellow = construct(p.yellow),
    blue = construct(p.blue),
    magenta = construct(p.magenta),
  }

  local content = [[
# Nightfox colors for Swaylock
## name: ${meta.name}
## upstream: ${meta.url}

# Background
color=${bg0}

# Inside (typing/verifying/wrong)
inside-color=${bg1}
inside-clear-color=${bg1}
inside-ver-color=${bg1}
inside-wrong-color=${bg1}

# Ring
ring-color=${bg3}
ring-clear-color=${yellow.base}
ring-ver-color=${blue.dim}
ring-wrong-color=${red.base}

# Key highlight
key-hl-color=${magenta.base}
bs-hl-color=${red.base}

# Separator
separator-color=${bg1}

# Text
text-color=${fg1}
text-clear-color=${fg1}
text-ver-color=${fg1}
text-wrong-color=${fg1}

# Layout text
layout-text-color=${fg3}
]]

  return template.parse_template_str(content, colors)
end

return M
