local template = require("nightfox.util.template")

local M = {}

---Render a Nightfox Plymouth theme for `spec`.
---
---This is the upstream `spinner` theme (`ModuleName=two-step`) with two
---changes: the boot background / progress-bar colors come from the fox
---palette, and the watermark is the Nightfox logo instead of the
---distribution logo (see the sibling `*_plymouth_watermark.svg` extra).
---
---`extra/plymouth/install.sh` turns this file into an installed theme under
---`/usr/share/plymouth/themes/`, adding the spinner animation frames and a
---`watermark.png` rasterised from the sibling watermark SVG.
function M.generate(spec, _)
  local name = spec.palette.meta.name
  local pretty = name:sub(1, 1):upper() .. name:sub(2)
  spec.title = name == "nightfox" and "Nightfox" or ("Nightfox " .. pretty)
  -- Keep the nightfox fox as a bare `nightfox` theme; suffix the others.
  spec.theme_name = name == "nightfox" and "nightfox" or ("nightfox-" .. name)

  local content = [[
# ${title} Plymouth theme
# name: ${palette.meta.name}
# upstream: ${palette.meta.url}
#
# Based on the upstream `spinner` theme (the two-step splash plugin). The
# distribution watermark is replaced by the Nightfox logo. Install with
# `extra/plymouth/install.sh ${palette.meta.name}`.

[Plymouth Theme]
Name=${title}
Description=Spinner-style boot splash using the ${palette.meta.name} palette and the Nightfox logo watermark.
ModuleName=two-step

[two-step]
Font=Cantarell 12
TitleFont=Cantarell Light 30
ImageDir=/usr/share/plymouth/themes/${theme_name}

# Layout, top to bottom: the Nightfox logo (watermark), then the password
# entry (LUKS unlock / login), then the spinner. The plugin draws the prompt
# text and keyboard hints below the entry box, so the box sits just below
# center with the logo clear above it and the spinner clear below.
WatermarkHorizontalAlignment=.5
WatermarkVerticalAlignment=.32
DialogHorizontalAlignment=.5
DialogVerticalAlignment=.55
TitleHorizontalAlignment=.5
TitleVerticalAlignment=.55
HorizontalAlignment=.5
VerticalAlignment=.76
MessageBelowAnimation=true

Transition=none
TransitionDuration=0.0

BackgroundStartColor=${bg0}
BackgroundEndColor=${bg1}
ProgressBarBackgroundColor=${bg3}
ProgressBarForegroundColor=${palette.blue}

[boot-up]
UseEndAnimation=false

[shutdown]
UseEndAnimation=false

[reboot]
UseEndAnimation=false

[updates]
SuppressMessages=true
ProgressBarShowPercentComplete=true
UseProgressBar=true
Title=Installing Updates...
SubTitle=Do not turn off your computer

[system-upgrade]
SuppressMessages=true
ProgressBarShowPercentComplete=true
UseProgressBar=true
Title=Upgrading System...
SubTitle=Do not turn off your computer

[firmware-upgrade]
SuppressMessages=true
ProgressBarShowPercentComplete=true
UseProgressBar=true
UseFirmwareBackground=true
Title=Upgrading Firmware...
SubTitle=Do not turn off your computer
]]

  content = template.parse_template_str(content, spec)

  -- Plymouth expects 0xRRGGBB; the palette renders #rrggbb.
  return (content:gsub("#(%x%x%x%x%x%x)", "0x%1"))
end

return M
