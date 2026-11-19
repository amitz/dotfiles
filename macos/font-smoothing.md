# Blurry text on external monitors

macOS renders text for Retina displays only (no subpixel antialiasing since
Mojave), so text on a non-Retina monitor such as the MSI Optix MAG274QRF-QD
looks soft. Some monitors also connect as YCbCr instead of RGB, which
makes colored (especially red) text fuzzy. Neither is fixed in macOS.

## BetterDisplay

[BetterDisplay](https://github.com/waydabber/BetterDisplay) (`brew install --cask betterdisplay`)
fixes both, per display:

- **Force RGB:** in the monitor's settings in BetterDisplay, set the connection
  mode / color mode to RGB. Confirm in the monitor's OSD info that it shows
  8-bit RGB, not 10-bit YCbCr.
- **HiDPI:** enable a HiDPI (scaled) resolution to get Retina-style rendering.

## Font smoothing

Turning font smoothing off makes thin text crisper on some monitors:

```sh
defaults -currentHost write -g AppleFontSmoothing -int 0
```

Undo it with:

```sh
defaults -currentHost delete -g AppleFontSmoothing
```

Log out and back in for either to take effect.
