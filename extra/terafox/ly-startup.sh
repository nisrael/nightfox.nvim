#!/bin/sh
# Nightfox Terafox palette for the ly display manager
# name: terafox
# upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/terafox/ly-startup.sh
#
# ly runs this before it takes control of the TTY. Enable it by pointing
# start_cmd at this file in /etc/ly/config.ini (its default already is):
#
#     start_cmd = $CONFIG_DIRECTORY/ly/startup.sh
#
# Install: copy to /etc/ly/startup.sh and `chmod +x` it. On the Linux
# console this repaints the 16 palette entries so ly's TTY matches
# Nightfox Terafox; under a graphical terminal $TERM is not "linux", the
# block is skipped, and the script does nothing.

if [ "$TERM" = "linux" ]; then
	i=0
	# Palette entries 0-7 (normal) then 8-15 (bright):
	# black red green yellow blue magenta cyan white
	for c in \
		2F3239 E85C51 7AA4A1 FDA47F 5A93AA AD5C7C A1CDD8 EBEBEB \
		4E5157 EB746B 8EB2AF FDB292 73A3B7 B97490 AFD4DE EEEEEE
	do
		printf '\033]P%x%s' "$i" "$c"
		i=$((i + 1))
	done

	# Redraw so the old palette does not leave colored artifacts behind.
	clear
fi
