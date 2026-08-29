#!/bin/sh
# Nightfox Dawnfox palette for the ly display manager
# name: dawnfox
# upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/dawnfox/ly-startup.sh
#
# ly runs this before it takes control of the TTY. Enable it by pointing
# start_cmd at this file in /etc/ly/config.ini (its default already is):
#
#     start_cmd = $CONFIG_DIRECTORY/ly/startup.sh
#
# Install: copy to /etc/ly/startup.sh and `chmod +x` it. On the Linux
# console this repaints the 16 palette entries so ly's TTY matches
# Nightfox Dawnfox; under a graphical terminal $TERM is not "linux", the
# block is skipped, and the script does nothing.

if [ "$TERM" = "linux" ]; then
	i=0
	# Palette entries 0-7 (normal) then 8-15 (bright):
	# black red green yellow blue magenta cyan white
	for c in \
		575279 B4637A 618774 EA9D34 286983 907AA9 56949F E5E9F0 \
		5F5695 C26D85 629F81 EEA846 2D81A3 9A80B9 5CA7B4 E6EBF3
	do
		printf '\033]P%x%s' "$i" "$c"
		i=$((i + 1))
	done

	# Redraw so the old palette does not leave colored artifacts behind.
	clear
fi
