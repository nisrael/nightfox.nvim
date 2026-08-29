#!/bin/sh
# Nightfox Duskfox palette for the ly display manager
# name: duskfox
# upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/duskfox/ly-startup.sh
#
# ly runs this before it takes control of the TTY. Enable it by pointing
# start_cmd at this file in /etc/ly/config.ini (its default already is):
#
#     start_cmd = $CONFIG_DIRECTORY/ly/startup.sh
#
# Install: copy to /etc/ly/startup.sh and `chmod +x` it. On the Linux
# console this repaints the 16 palette entries so ly's TTY matches
# Nightfox Duskfox; under a graphical terminal $TERM is not "linux", the
# block is skipped, and the script does nothing.

if [ "$TERM" = "linux" ]; then
	i=0
	# Palette entries 0-7 (normal) then 8-15 (bright):
	# black red green yellow blue magenta cyan white
	for c in \
		393552 EB6F92 A3BE8C F6C177 569FBA C4A7E7 9CCFD8 E0DEF4 \
		47407D F083A2 B1D196 F9CB8C 65B1CD CCB1ED A6DAE3 E2E0F7
	do
		printf '\033]P%x%s' "$i" "$c"
		i=$((i + 1))
	done

	# Redraw so the old palette does not leave colored artifacts behind.
	clear
fi
