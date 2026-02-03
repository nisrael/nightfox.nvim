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
    black = construct(p.black),
    red = construct(p.red),
    green = construct(p.green),
    yellow = construct(p.yellow),
    blue = construct(p.blue),
    magenta = construct(p.magenta),
    cyan = construct(p.cyan),
    white = construct(p.white),
  }

  local content = [[
# Nightfox colors for Foot
## name: ${meta.name}
## upstream: ${meta.url}

[colors]
background=${bg1}
foreground=${fg1}

# Normal colors
regular0=${black.base}
regular1=${red.base}
regular2=${green.base}
regular3=${yellow.base}
regular4=${blue.base}
regular5=${magenta.base}
regular6=${cyan.base}
regular7=${white.base}

# Bright colors
bright0=${black.bright}
bright1=${red.bright}
bright2=${green.bright}
bright3=${yellow.bright}
bright4=${blue.bright}
bright5=${magenta.bright}
bright6=${cyan.bright}
bright7=${white.bright}
]]

  return template.parse_template_str(content, colors)
end

return M
