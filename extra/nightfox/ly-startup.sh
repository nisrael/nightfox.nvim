#!/bin/sh
# Nightfox palette for the ly display manager
# name: nightfox
# upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/ly-startup.sh
#
# ly runs this before it takes control of the TTY. Enable it by pointing
# start_cmd at this file in /etc/ly/config.ini (its default already is):
#
#     start_cmd = $CONFIG_DIRECTORY/ly/startup.sh
#
# Install: copy to /etc/ly/startup.sh and `chmod +x` it. On the Linux
# console this repaints the 16 palette entries so ly's TTY matches
# Nightfox; under a graphical terminal $TERM is not "linux", the
# block is skipped, and the script does nothing.

if [ "$TERM" = "linux" ]; then
	i=0
	# Palette entries 0-7 (normal) then 8-15 (bright):
	# black red green yellow blue magenta cyan white
	for c in \
		393B44 C94F6D 81B29A DBC074 719CD6 9D79D6 63CDCF DFDFE0 \
		575860 D16983 8EBAA4 E0C989 86ABDC BAA1E2 7AD5D6 E4E4E5
	do
		printf '\033]P%x%s' "$i" "$c"
		i=$((i + 1))
	done

	# Redraw so the old palette does not leave colored artifacts behind.
	clear
fi
