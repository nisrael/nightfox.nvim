#!/bin/sh
# Nightfox Carbonfox palette for the ly display manager
# name: carbonfox
# upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/ly-startup.sh
#
# ly runs this before it takes control of the TTY. Enable it by pointing
# start_cmd at this file in /etc/ly/config.ini (its default already is):
#
#     start_cmd = $CONFIG_DIRECTORY/ly/startup.sh
#
# Install: copy to /etc/ly/startup.sh and `chmod +x` it. On the Linux
# console this repaints the 16 palette entries so ly's TTY matches
# Nightfox Carbonfox; under a graphical terminal $TERM is not "linux", the
# block is skipped, and the script does nothing.

if [ "$TERM" = "linux" ]; then
	i=0
	# Palette entries 0-7 (normal) then 8-15 (bright):
	# black red green yellow blue magenta cyan white
	for c in \
		282828 EE5396 25BE6A 08BDBA 78A9FF BE95FF 33B1FF DFDFE0 \
		484848 F16DA6 46C880 2DC7C4 8CB6FF C8A5FF 52BDFF E4E4E5
	do
		printf '\033]P%x%s' "$i" "$c"
		i=$((i + 1))
	done

	# Redraw so the old palette does not leave colored artifacts behind.
	clear
fi
