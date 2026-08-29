#!/usr/bin/env bash
#
# Install a Nightfox Plymouth theme.
#
# The theme is the upstream `spinner` theme (ModuleName=two-step) with the
# boot background / progress-bar colors taken from a Nightfox palette and the
# distribution watermark replaced by the Nightfox logo.
#
# Usage:
#   sudo ./install.sh [fox]
#
#     fox = nightfox (default) | dayfox | dawnfox | duskfox
#         | nordfox  | terafox | carbonfox
#
# Requirements:
#   * the upstream `spinner` theme installed (its animation frames are reused)
#   * one of: rsvg-convert, magick, convert, inkscape (to rasterize the logo)
#
# Environment:
#   PLYMOUTH_THEMES_DIR  override the themes dir (default /usr/share/plymouth/themes).
#                        Note: the generated .plymouth bakes in the default
#                        path as ImageDir, so only override for staging.
#
set -euo pipefail

FOX="${1:-nightfox}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$(dirname "$HERE")/$FOX"
CONF="$SRC_DIR/$FOX.plymouth"
WATERMARK_SVG="$SRC_DIR/${FOX}_plymouth_watermark.svg"

if [ "$FOX" = "nightfox" ]; then THEME_NAME="nightfox"; else THEME_NAME="nightfox-$FOX"; fi
THEMES_DIR="${PLYMOUTH_THEMES_DIR:-/usr/share/plymouth/themes}"
SPINNER_DIR="$THEMES_DIR/spinner"
DEST_DIR="$THEMES_DIR/$THEME_NAME"

[ -f "$CONF" ] || { echo "error: no theme config at $CONF" >&2; exit 1; }
[ -f "$WATERMARK_SVG" ] || { echo "error: no watermark at $WATERMARK_SVG" >&2; exit 1; }
[ -d "$SPINNER_DIR" ] || {
  echo "error: upstream 'spinner' theme not found at $SPINNER_DIR" >&2
  echo "       install it first (e.g. the plymouth package ships it)." >&2
  exit 1
}

rasterize() {
  local svg="$1" png="$2"
  if command -v rsvg-convert >/dev/null 2>&1; then
    rsvg-convert -w 320 -h 320 -o "$png" "$svg"
  elif command -v magick >/dev/null 2>&1; then
    magick -background none "$svg" -resize 320x320 "$png"
  elif command -v convert >/dev/null 2>&1; then
    convert -background none "$svg" -resize 320x320 "$png"
  elif command -v inkscape >/dev/null 2>&1; then
    inkscape "$svg" --export-type=png --export-filename="$png" -w 320 -h 320 >/dev/null
  else
    echo "error: need rsvg-convert, magick, convert or inkscape to rasterize the watermark" >&2
    exit 1
  fi
}

install -d "$DEST_DIR"

# Animation frames and widgets come from the upstream spinner theme; only the
# watermark and the .plymouth file are Nightfox-specific.
shopt -s nullglob
for f in "$SPINNER_DIR"/*.png; do
  [ "$(basename "$f")" = "watermark.png" ] && continue
  install -m 0644 "$f" "$DEST_DIR/"
done
shopt -u nullglob

install -m 0644 "$CONF" "$DEST_DIR/$THEME_NAME.plymouth"
rasterize "$WATERMARK_SVG" "$DEST_DIR/watermark.png"

echo "installed '$THEME_NAME' -> $DEST_DIR"
echo
echo "activate it with:"
echo "  sudo plymouth-set-default-theme -R $THEME_NAME"
echo
echo "on Arch, make sure the 'plymouth' mkinitcpio hook is enabled, then:"
echo "  sudo plymouth-set-default-theme $THEME_NAME && sudo mkinitcpio -P"
