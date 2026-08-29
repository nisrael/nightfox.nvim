local template = require("nightfox.util.template")

local M = {}

function M.generate(spec, _)
  local content = [[
{
  "ui": {
    "border_primary": "${bg4}",
    "border_secondary": "${bg3}",
    "header_background": "${bg0}",
    "header_text": "${fg1}",
    "footer_background": "${bg0}",
    "footer_text": "${fg2}",
    "text_primary": "${fg1}",
    "text_secondary": "${fg2}",
    "text_accent": "${palette.blue}",
    "selection_background": "${sel0}",
    "selection_text": "${fg1}"
  },
  "charts": {
    "network_download": "${palette.green}",
    "network_upload": "${palette.blue}",
    "network_line": "${bg4}",
    "cpu_core_low": "${palette.green}",
    "cpu_core_medium": "${palette.yellow}",
    "cpu_core_high": "${palette.red}",
    "disk_read": "${palette.cyan}",
    "disk_write": "${palette.magenta}"
  },
  "progress_bars": {
    "memory_low": "${palette.green}",
    "memory_medium": "${palette.yellow}",
    "memory_high": "${palette.red}",
    "disk_low": "${palette.green}",
    "disk_medium": "${palette.yellow}",
    "disk_high": "${palette.red}",
    "cpu_low": "${palette.green}",
    "cpu_medium": "${palette.yellow}",
    "cpu_high": "${palette.red}",
    "progress_background": "${bg2}"
  },
  "temperature": {
    "cold": "${palette.blue}",
    "warm": "${palette.yellow}",
    "hot": "${palette.red}",
    "danger": "${palette.red.bright}"
  },
  "status": {
    "success": "${palette.green}",
    "warning": "${palette.yellow}",
    "error": "${palette.red}",
    "info": "${palette.blue}"
  }
}
]]

  return template.parse_template_str(content, spec)
end

return M
