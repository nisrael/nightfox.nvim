#!/bin/sh
# Nightfox Dayfox palette for the ly display manager
# name: dayfox
# upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/dayfox/ly-startup.sh
#
# ly runs this before it takes control of the TTY. Enable it by pointing
# start_cmd at this file in /etc/ly/config.ini (its default already is):
#
#     start_cmd = $CONFIG_DIRECTORY/ly/startup.sh
#
# Install: copy to /etc/ly/startup.sh and `chmod +x` it. On the Linux
# console this repaints the 16 palette entries so ly's TTY matches
# Nightfox Dayfox; under a graphical terminal $TERM is not "linux", the
# block is skipped, and the script does nothing.

if [ "$TERM" = "linux" ]; then
	i=0
	# Palette entries 0-7 (normal) then 8-15 (bright):
	# black red green yellow blue magenta cyan white
	for c in \
		352C24 A5222F 396847 AC5402 2848A9 6E33CE 287980 F2E9E1 \
		534C45 B3434E 577F63 B86E28 4863B6 8452D5 488D93 F4ECE6
	do
		printf '\033]P%x%s' "$i" "$c"
		i=$((i + 1))
	done

	# Redraw so the old palette does not leave colored artifacts behind.
	clear
fi
