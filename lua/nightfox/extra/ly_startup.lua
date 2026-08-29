local M = {}

-- The Linux console keeps a 16-entry palette (0-7 normal, 8-15 bright). The
-- escape `ESC ] P n rrggbb` reprograms entry `n` (a single hex digit) to a
-- 24-bit color. ly's own `res/startup.sh` ships this exact loop commented out
-- as "an example of changing the default TTY colors"; this is that example
-- with the fox palette filled in and switched on.
local function hex6(value)
  return (value:gsub("^#", ""):upper())
end

---Render `startup.sh` for `spec` -- the script ly runs before it grabs the TTY.
---
---`config.ini` points at it with `start_cmd = $CONFIG_DIRECTORY/ly/startup.sh`.
---On the Linux console (`TERM=linux`) it repaints the 16 palette entries so
---ly's UI, and the getty left behind on logout, match the theme. Under a
---graphical terminal `TERM` is not `linux`, so the block is skipped and the
---script is a no-op.
function M.generate(spec, _)
  local p = spec.palette
  local pretty = p.meta.name:sub(1, 1):upper() .. p.meta.name:sub(2)
  local title = p.meta.name == "nightfox" and "Nightfox" or ("Nightfox " .. pretty)

  -- Console entries 0-15: normal black..white, then bright black..white.
  local order = { "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white" }
  local normal, bright = {}, {}
  for _, name in ipairs(order) do
    normal[#normal + 1] = hex6(p[name].base)
    bright[#bright + 1] = hex6(p[name].bright)
  end

  local lines = {
    "#!/bin/sh",
    ("# %s palette for the ly display manager"):format(title),
    "# name: " .. p.meta.name,
    "# upstream: " .. p.meta.url,
    "#",
    "# ly runs this before it takes control of the TTY. Enable it by pointing",
    "# start_cmd at this file in /etc/ly/config.ini (its default already is):",
    "#",
    "#     start_cmd = $CONFIG_DIRECTORY/ly/startup.sh",
    "#",
    "# Install: copy to /etc/ly/startup.sh and `chmod +x` it. On the Linux",
    "# console this repaints the 16 palette entries so ly's TTY matches",
    "# " .. title .. '; under a graphical terminal $TERM is not "linux", the',
    "# block is skipped, and the script does nothing.",
    "",
    'if [ "$TERM" = "linux" ]; then',
    "\ti=0",
    "\t# Palette entries 0-7 (normal) then 8-15 (bright):",
    "\t# black red green yellow blue magenta cyan white",
    "\tfor c in \\",
    "\t\t" .. table.concat(normal, " ") .. " \\",
    "\t\t" .. table.concat(bright, " ") .. "\n\tdo",
    '\t\tprintf \'\\033]P%x%s\' "$i" "$c"',
    "\t\ti=$((i + 1))",
    "\tdone",
    "",
    "\t# Redraw so the old palette does not leave colored artifacts behind.",
    "\tclear",
    "fi",
  }

  return table.concat(lines, "\n") .. "\n"
end

return M
