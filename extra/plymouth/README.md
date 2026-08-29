# Nightfox Plymouth theme

A [Plymouth](https://www.freedesktop.org/wiki/Software/Plymouth/) boot splash
based on the upstream **spinner** theme (`ModuleName=two-step`), with two
changes:

- the background and progress-bar colors are taken from a Nightfox palette
- the distribution watermark is replaced by the Nightfox logo

## Files

Per fox, in `extra/<fox>/`:

| File | Purpose |
| --- | --- |
| `<fox>.plymouth` | theme config, palette colors, `0xRRGGBB` |
| `<fox>_plymouth_watermark.svg` | Nightfox logo, recolored for that fox |

The spinner animation frames are **not** shipped here; the installer reuses
them from the system `spinner` theme. Those frames are light-colored, so the
light foxes (`dayfox`, `dawnfox`) get a low-contrast spinner — the watermark
and progress bar still theme correctly.

## Layout

Modeled on the upstream spinner theme, but with the logo promoted from a
small bottom watermark to a centered emblem. Top to bottom:

- Nightfox logo — watermark at 32% down, rasterized at 210&nbsp;px
  (override with `WATERMARK_PX=<n> sudo ./install.sh …`; ~420 suits 4K+)
- password entry — LUKS unlock / login, box at 55% down; two-step draws the
  prompt text and keyboard hints *below* the box
- spinner — 76% down

The box sits just below center with the logo clear above it and the spinner
clear below, so nothing overlaps during disk unlock at any common resolution.

## Install

```sh
sudo ./install.sh [fox]
```

`fox` is one of `nightfox` (default), `dayfox`, `dawnfox`, `duskfox`,
`nordfox`, `terafox`, `carbonfox`.

This creates `/usr/share/plymouth/themes/<theme>/` (`<theme>` is `nightfox`
for the nightfox fox, `nightfox-<fox>` otherwise) containing:

- the `*.png` frames copied from `/usr/share/plymouth/themes/spinner/`
- `watermark.png`, rasterized from the fox's watermark SVG
- `<theme>.plymouth`

### Requirements

- the upstream `spinner` theme (ships with most `plymouth` packages)
- one of `rsvg-convert`, `magick`, `convert`, `inkscape` to rasterize the logo

### Activate

```sh
sudo plymouth-set-default-theme -R <theme>
```

On Arch, enable the `plymouth` `mkinitcpio` hook first, then:

```sh
sudo plymouth-set-default-theme <theme>
sudo mkinitcpio -P
```

### Preview without rebooting

```sh
sudo plymouthd --debug --tty=/dev/tty7
sudo plymouth --show-splash
sleep 5
sudo plymouth --quit
```
