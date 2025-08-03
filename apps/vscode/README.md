# Visual Studio Code Settings

### How to Activate

To use these settings, create symbolic links for the files into the following directory:

`/Users/[YourUsername]/Library/Application Support/Code/User/`

This will allow Visual Studio Code to load the configuration files.

### Enable Key Repeat

By default, using `h` and `j` in VS Code will only move the cursor a single line at a time. To enable continuous key repeat for these and other keys, run the following command in your terminal:

```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
