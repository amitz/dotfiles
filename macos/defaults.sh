#!/bin/sh
#
# My macOS defaults.
# Inspired by https://mths.be/macos
#
# Keys are undocumented and can silently stop working between macOS versions.
# Check a value with: defaults read <domain> <key>

set -eu

# Close System Settings so it doesn't overwrite the changes below.
osascript -e 'tell application "System Settings" to quit' || true

###############################################################################
# Appearance                                                                  #
###############################################################################

# Dark mode (System Settings > Appearance)
defaults write NSGlobalDomain AppleInterfaceStyle -string Dark

# Dark app icons and widgets (System Settings > Appearance > Icon & widget style)
defaults write NSGlobalDomain AppleIconAppearanceTheme -string RegularDark

###############################################################################
# Menu bar                                                                    #
###############################################################################

# Show battery percentage in the menu bar
# (System Settings > Control Center > Battery > Show Percentage)
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Blurred menu bar background instead of fully transparent
# (System Settings > Menu Bar > Show menu bar background)
defaults write NSGlobalDomain SLSMenuBarUseBlurredAppearance -bool true

# Reduce transparency system-wide; the only built-in way to get a solid, dark
# menu bar (also affects sidebars, the Dock, Control Center, etc.).
# Protected key: writing it needs Full Disk Access for the terminal.
if ! defaults write com.apple.universalaccess reduceTransparency -bool true 2>/dev/null; then
	echo "Skipped 'Reduce transparency': the terminal has no Full Disk Access."
	echo "  Set it by hand: System Settings > Accessibility > Display > Reduce transparency."
	echo "  Or grant the terminal Full Disk Access (System Settings > Privacy & Security >"
	echo "  Full Disk Access) and re-run this script."
fi

###############################################################################
# Dialogs                                                                     #
###############################################################################

# Expand the save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

###############################################################################
# Windows                                                                     #
###############################################################################

# No gaps between tiled windows (System Settings > Desktop & Dock > Windows >
# "Tiled windows have margins")
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false

# Don't reopen windows when logging back in
# (the "Reopen windows when logging back in" checkbox in the Restart/Log Out dialog)
defaults write com.apple.loginwindow TALLogoutSavesState -bool false

###############################################################################
# Keyboard                                                                    #
###############################################################################

# Fast key repeat (System Settings > Keyboard > Key repeat rate / Delay until repeat)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Repeat keys when held instead of showing the accent picker (needed for hjkl in vim modes)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

###############################################################################
# Screenshots                                                                 #
###############################################################################

# Save screenshots to ~/Pictures/Screenshots
mkdir -p "${HOME}/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Disable the shadow in window screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Show all filename extensions (Finder > Settings > Advanced)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show the status bar (Finder > View > Show Status Bar)
defaults write com.apple.finder ShowStatusBar -bool true

# Show the path bar (Finder > View > Show Path Bar)
defaults write com.apple.finder ShowPathbar -bool true

# Show the full POSIX path as the window title ("/Users/me/Documents" instead of "Documents")
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name (Finder > Settings > Advanced)
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Don't warn when changing a file extension (Finder > Settings > Advanced)
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Don't warn before emptying the Trash (Finder > Settings > Advanced)
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Open new Finder windows in the home folder instead of Recents
# (Finder > Settings > General > New Finder windows show)
defaults write com.apple.finder NewWindowTarget -string PfHm

# Don't show external disks or removable media on the desktop
# (Finder > Settings > General > Show these items on the desktop)
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Use list view for new Finder windows (icnv, clmv, glyv, Nlsv)
# Folders opened inside an existing window keep that window's view, and folders
# with their own saved view (.DS_Store) keep theirs.
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv

###############################################################################
# Dock and Spaces                                                             #
###############################################################################

# Set the icon size of Dock items to 64 pixels
defaults write com.apple.dock tilesize -int 64

# Minimize windows using the scale effect (System Settings > Desktop & Dock)
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application's icon (System Settings > Desktop & Dock)
defaults write com.apple.dock minimize-to-application -bool true

# Don't bounce Dock icons when launching an app
defaults write com.apple.dock launchanim -bool false

# Don't rearrange Spaces based on most recent use
# (System Settings > Desktop & Dock > Mission Control)
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show the Dock, with no delay and no animation
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Make Dock icons of hidden applications (Cmd+H) translucent
defaults write com.apple.dock showhidden -bool true

# Don't show recent applications in the Dock (System Settings > Desktop & Dock)
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Clean up                                                                    #
###############################################################################

for app in ControlCenter Dock Finder; do
	killall "${app}" >/dev/null 2>&1 || true
done

echo "Done. Log out and back in for appearance, keyboard and window changes to take effect."
echo "Some settings can't be scripted; see macos/README.md (Set by hand)."
