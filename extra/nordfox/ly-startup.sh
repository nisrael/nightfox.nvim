#!/bin/sh
# Nightfox Nordfox palette for the ly display manager
# name: nordfox
# upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nordfox/ly-startup.sh
#
# ly runs this before it takes control of the TTY. Enable it by pointing
# start_cmd at this file in /etc/ly/config.ini (its default already is):
#
#     start_cmd = $CONFIG_DIRECTORY/ly/startup.sh
#
# Install: copy to /etc/ly/startup.sh and `chmod +x` it. On the Linux
# console this repaints the 16 palette entries so ly's TTY matches
# Nightfox Nordfox; under a graphical terminal $TERM is not "linux", the
# block is skipped, and the script does nothing.

if [ "$TERM" = "linux" ]; then
	i=0
	# Palette entries 0-7 (normal) then 8-15 (bright):
	# black red green yellow blue magenta cyan white
	for c in \
		3B4252 BF616A A3BE8C EBCB8B 81A1C1 B48EAD 88C0D0 E5E9F0 \
		465780 D06F79 B1D196 F0D399 8CAFD2 C895BF 93CCDC E7ECF4
	do
		printf '\033]P%x%s' "$i" "$c"
		i=$((i + 1))
	done

	# Redraw so the old palette does not leave colored artifacts behind.
	clear
fi
