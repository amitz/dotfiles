# `bin` — Executable Scripts

This directory contains custom shell scripts and utilities that are accessible from anywhere on my system.

## How to Use

To make these scripts available, add this directory to your shell's **`$PATH`** environment variable. Most of these scripts are located in `./local/bin`.

## Scripts

### `git-publish`
This script allows you to use `git publish` as a shorter syntax for `git push -u origin [branch name]`.

### `git-rb`
Easily remove both a local and a remote Git branch.

### `show_colors`
Lists all available terminal colors, which is useful for customizing themes.

### `tat`
Attaches to or creates a new `tmux` session named after the current directory. I typically call this from my `.zshrc` file to automatically start `tmux`.

### `tmux-popup`
A standardized way to open a `tmux` popup. This is used in my `tmux` configuration file to switch between sessions.
