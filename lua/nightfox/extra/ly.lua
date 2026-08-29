local M = {}

-- ly stores every color as a 32-bit `0xSSRRGGBB` value: `SS` is a styling byte
-- (0x00 = none, 0x01 = TB_BOLD, ...), the low 24 bits are RGB. The palette
-- renders `#rrggbb`, so swap the prefix and prepend the styling byte.
--
-- `0x00000000` is special-cased by ly to mean "terminal default", so a pure
-- black with no styling is bumped to TB_HI_BLACK (0x20), which forces black.
local function color(hex, style)
  style = style or 0
  local rgb = (hex:gsub("^#", "")):upper()
  if rgb == "000000" and style == 0 then
    style = 0x20
  end
  return string.format("0x%02X%s", style, rgb)
end

---Render the color settings of `/etc/ly/config.ini` for `spec`.
---
---ly keeps its whole configuration in a single file, so this is a snippet to
---merge rather than a drop-in file: it only sets the color keys and leaves
---every other option at its default.
function M.generate(spec, _)
  local p = spec.palette
  local pretty = p.meta.name:sub(1, 1):upper() .. p.meta.name:sub(2)
  local title = p.meta.name == "nightfox" and "Nightfox" or ("Nightfox " .. pretty)

  local lines = {
    ("# %s colors for the ly display manager"):format(title),
    "# name: " .. p.meta.name,
    "# upstream: " .. p.meta.url,
    "#",
    "# ly keeps its whole config in one file. Copy the keys below into",
    "# /etc/ly/config.ini, replacing the matching lines.",
    "",
    "# Login box",
    "fg = " .. color(spec.fg1),
    "bg = " .. color(spec.bg1),
    "border_fg = " .. color(spec.bg4),
    "",
    "# Errors (bold, matching ly's default styling)",
    "error_fg = " .. color(p.red.base, 0x01),
    "error_bg = " .. color(spec.bg1),
    "",
    "# Background-animation colors (only used when `animation` is set)",
    "cmatrix_fg = " .. color(p.green.base),
    "cmatrix_head_col = " .. color(p.green.bright, 0x01),
    "gameoflife_fg = " .. color(p.green.base),
    "colormix_col1 = " .. color(p.blue.base),
    "colormix_col2 = " .. color(p.magenta.base),
    "colormix_col3 = " .. color(spec.bg0),
    "doom_top_color = " .. color(p.red.base),
    "doom_middle_color = " .. color(p.yellow.base),
    "doom_bottom_color = " .. color(p.white.base),
  }

  return table.concat(lines, "\n") .. "\n"
end

return M
