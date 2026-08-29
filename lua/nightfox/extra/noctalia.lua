local Color = require("nightfox.lib.color")

local M = {}

-- Noctalia palettes require both a `dark` and a `light` variant in a single
-- file (https://github.com/noctalia-dev/community-palettes). The foxes are
-- single mode, so every dark fox is paired with its canonical light
-- counterpart. Light-only foxes are skipped: they are emitted as the `light`
-- side of their pair.
local counterpart = {
  nightfox = "dayfox",
  duskfox = "dawnfox",
  nordfox = "dayfox",
  terafox = "dayfox",
  carbonfox = "dawnfox",
}

local term_keys = { "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white" }

---Pick the theme neutral with the best contrast against `bg`, falling back to
---plain black/white only when neither neutral clears WCAG AA.
---@param bg string hex color the text/icon is drawn on top of
---@param candidates string[] theme neutrals to choose from (e.g. bg0/fg0)
---@return string
local function on(bg, candidates)
  local base = Color.from_hex(bg)
  local best, best_ratio
  for _, cand in ipairs({ candidates[1], candidates[2], "#000000", "#ffffff" }) do
    local ratio = base:contrast(Color.from_hex(cand))
    if not best_ratio or (best_ratio < 4.5 and ratio > best_ratio) then
      best, best_ratio = cand, ratio
    end
  end
  return best
end

---Map a nightfox spec onto Noctalia's 16 color roles.
---@param s Spec
---@return table[] ordered { key, value } pairs
local function roles(s)
  local p = s.palette
  local text = { s.bg0, s.fg0 }
  return {
    { "mPrimary", p.blue.base },
    { "mOnPrimary", on(p.blue.base, text) },
    { "mSecondary", p.magenta.base },
    { "mOnSecondary", on(p.magenta.base, text) },
    { "mTertiary", p.cyan.base },
    { "mOnTertiary", on(p.cyan.base, text) },
    { "mError", p.red.base },
    { "mOnError", on(p.red.base, text) },
    { "mSurface", s.bg1 },
    { "mOnSurface", s.fg1 },
    { "mSurfaceVariant", s.bg2 },
    { "mOnSurfaceVariant", s.fg2 },
    { "mOutline", s.bg4 },
    -- shadows read as depth cues in both modes, so keep them dark regardless
    -- of the fox's own background ramp.
    { "mShadow", "#000000" },
    { "mHover", p.blue.base },
    { "mOnHover", on(p.blue.base, text) },
  }
end

---@param s Spec
---@return table
local function terminal(s)
  local p = s.palette
  local normal, bright = {}, {}
  for _, k in ipairs(term_keys) do
    normal[k] = p[k].base
    bright[k] = p[k].bright
  end
  return {
    normal = normal,
    bright = bright,
    foreground = s.fg1,
    background = s.bg1,
    selectionFg = s.fg1,
    selectionBg = s.sel0,
    cursorText = s.bg1,
    cursor = s.fg1,
  }
end

local function q(v)
  return '"' .. v .. '"'
end

---Render one `dark`/`light` variant as pretty JSON. `pad` is the indent of the
---closing brace; the opening brace is written inline by the caller.
---@param s Spec
---@param pad string
---@return string
local function variant(s, pad)
  local i2 = pad .. "  "
  local i3 = pad .. "    "
  local i4 = pad .. "      "
  local lines = {}

  for _, kv in ipairs(roles(s)) do
    lines[#lines + 1] = i2 .. q(kv[1]) .. ": " .. q(kv[2]) .. ","
  end

  local t = terminal(s)
  local function group(name, g, comma)
    local parts = {}
    for _, k in ipairs(term_keys) do
      parts[#parts + 1] = i4 .. q(k) .. ": " .. q(g[k])
    end
    return i3 .. q(name) .. ": {\n" .. table.concat(parts, ",\n") .. "\n" .. i3 .. "}" .. comma
  end

  local term = {
    i2 .. q("terminal") .. ": {",
    group("normal", t.normal, ","),
    group("bright", t.bright, ","),
    i3 .. q("foreground") .. ": " .. q(t.foreground) .. ",",
    i3 .. q("background") .. ": " .. q(t.background) .. ",",
    i3 .. q("selectionFg") .. ": " .. q(t.selectionFg) .. ",",
    i3 .. q("selectionBg") .. ": " .. q(t.selectionBg) .. ",",
    i3 .. q("cursorText") .. ": " .. q(t.cursorText) .. ",",
    i3 .. q("cursor") .. ": " .. q(t.cursor),
    i2 .. "}",
  }
  lines[#lines + 1] = table.concat(term, "\n")

  return "{\n" .. table.concat(lines, "\n") .. "\n" .. pad .. "}"
end

---@param spec Spec dark fox spec supplied by the extra generator
---@return string|nil json, nil for foxes without a Noctalia pairing
function M.generate(spec, _)
  local light_name = counterpart[spec.palette.meta.name]
  if not light_name then
    return nil
  end

  local light = require("nightfox.spec").load(light_name)

  return "{\n"
    .. '  "dark": '
    .. variant(spec, "  ")
    .. ",\n"
    .. '  "light": '
    .. variant(light, "  ")
    .. "\n}\n"
end

return M
