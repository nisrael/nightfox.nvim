local template = require("nightfox.util.template")

local M = {}

function M.generate(spec, _)
  local content = [[
# vim:fileencoding=utf-8:foldmethod=marker
# Nightfox colors for Yazi
## name: ${palette.meta.name}
## upstream: ${palette.meta.url}

# : Manager {{{

[mgr]
cwd = { fg = "${palette.cyan}" }

# Hovered
hovered         = { reversed = true }
preview_hovered = { underline = true }

# Find
find_keyword  = { fg = "${palette.yellow}", bold = true, italic = true, underline = true }
find_position = { fg = "${palette.pink}", bg = "reset", bold = true, italic = true }

# Marker
marker_copied   = { fg = "${palette.green}", bg = "${palette.green}" }
marker_cut      = { fg = "${palette.red}", bg = "${palette.red}" }
marker_marked   = { fg = "${palette.cyan}", bg = "${palette.cyan}" }
marker_selected = { fg = "${palette.yellow}", bg = "${palette.yellow}" }

# Count
count_copied   = { fg = "${bg1}", bg = "${palette.green}" }
count_cut      = { fg = "${bg1}", bg = "${palette.red}" }
count_selected = { fg = "${bg1}", bg = "${palette.yellow}" }

# Border
border_symbol = "│"
border_style  = { fg = "${fg3}" }

# : }}}


# : Tabs {{{

[tabs]
active   = { fg = "${bg1}", bg = "${palette.blue}", bold = true }
inactive = { fg = "${palette.blue}", bg = "${bg3}" }

# : }}}


# : Mode {{{

[mode]

normal_main = { fg = "${bg1}", bg = "${palette.blue}", bold = true }
normal_alt  = { fg = "${palette.blue}", bg = "${bg3}" }

# Select mode
select_main = { fg = "${bg1}", bg = "${palette.cyan}", bold = true }
select_alt  = { fg = "${palette.cyan}", bg = "${bg3}" }

# Unset mode
unset_main = { fg = "${bg1}", bg = "${palette.pink}", bold = true }
unset_alt  = { fg = "${palette.pink}", bg = "${bg3}" }

# : }}}


# : Status bar {{{

[status]
# Permissions
perm_sep   = { fg = "${fg3}" }
perm_type  = { fg = "${palette.blue}" }
perm_read  = { fg = "${palette.yellow}" }
perm_write = { fg = "${palette.red}" }
perm_exec  = { fg = "${palette.green}" }

# Progress
progress_label  = { fg = "${fg0}", bold = true }
progress_normal = { fg = "${palette.green}", bg = "${bg4}" }
progress_error  = { fg = "${palette.yellow}", bg = "${palette.red}" }

# : }}}


# : Pick {{{

[pick]
border   = { fg = "${palette.blue}" }
active   = { fg = "${palette.pink}", bold = true }
inactive = {}

# : }}}


# : Input {{{

[input]
border   = { fg = "${palette.blue}" }
title    = {}
value    = {}
selected = { reversed = true }

# : }}}


# : Completion {{{

[cmp]
border = { fg = "${palette.blue}" }

# : }}}


# : Tasks {{{

[tasks]
border  = { fg = "${palette.blue}" }
title   = {}
hovered = { fg = "${palette.pink}", bold = true }

# : }}}


# : Which {{{

[which]
mask            = { bg = "${bg3}" }
cand            = { fg = "${palette.cyan}" }
rest            = { fg = "${fg2}" }
desc            = { fg = "${palette.pink}" }
separator       = "  "
separator_style = { fg = "${bg4}" }

# : }}}


# : Help {{{

[help]
on      = { fg = "${palette.cyan}" }
run     = { fg = "${palette.pink}" }
hovered = { reversed = true, bold = true }
footer  = { fg = "${bg3}", bg = "${fg1}" }

# : }}}


# : Spotter {{{

[spot]
border   = { fg = "${palette.blue}" }
title    = { fg = "${palette.blue}" }
tbl_col  = { fg = "${palette.cyan}" }
tbl_cell = { fg = "${palette.pink}", bg = "${bg4}" }

# : }}}


# : Notification {{{

[notify]
title_info  = { fg = "${palette.green}" }
title_warn  = { fg = "${palette.yellow}" }
title_error = { fg = "${palette.red}" }

# : }}}


# : File-specific styles {{{

[filetype]

rules = [
	# Image
	{ mime = "image/*", fg = "${palette.cyan}" },
	# Media
	{ mime = "{audio,video}/*", fg = "${palette.yellow}" },
	# Archive
	{ mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}", fg = "${palette.pink}" },
	# Document
	{ mime = "application/{pdf,doc,rtf}", fg = "${palette.green}" },
	# Virtual file system
	{ mime = "vfs/{absent,stale}", fg = "${fg2}" },
	# Fallback
	{ url = "*", fg = "${fg1}" },
	{ url = "*/", fg = "${palette.blue}" },
	# TODO: remove
	{ name = "*", fg = "${fg1}" },
	{ name = "*/", fg = "${palette.blue}" }
]

# : }}}
]]

  return template.parse_template_str(content, spec)
end

return M
