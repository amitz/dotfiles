# `macos` — macOS-Specific Settings

System-level settings rather than application configurations.

- [`defaults.sh`](./defaults.sh): sets macOS `defaults` (appearance, menu bar,
  Finder, Dock, keyboard, windows, screenshots). Only lists settings that differ from the macOS
  default. Safe to re-run; no sudo needed.
- [`font-smoothing.md`](./font-smoothing.md): fixing blurry text on non-Retina
  external monitors.

## Set by hand

Settings that can't be scripted without sudo, or use protected/undocumented keys:

- **Reduce transparency:** System Settings > Accessibility > Display. `defaults.sh`
  sets it only if the terminal has Full Disk Access; otherwise it prints a warning.
- **Show window title icons** (folder icon always next to window titles):
  System Settings > Accessibility > Display.
- **Sound icon always in the menu bar:** System Settings > Control Center > Sound >
  Always Show in Menu Bar.
- **Display-off times** (defaults: 2 min on battery, 10 min on power adapter):
  System Settings > Lock Screen.
- **Never sleep on the charger** (so clamshell mode with an external monitor
  doesn't sleep when the display turns off): System Settings > Battery > Options >
  "Prevent automatic sleeping on power adapter when the display is off".

### Power settings drifted from the defaults

If the Mac never sleeps on battery (`pmset -g custom` shows `sleep 0` under
Battery Power), reset all power settings to the macOS defaults once, then turn the
charger option above back on:

```sh
sudo pmset restoredefaults
pmset -g custom   # check
```

Closing the lid without an external display always sleeps, whatever is set here.
