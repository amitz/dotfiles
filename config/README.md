# `config` — XDG Configurations

This directory is for configurations that follow the **XDG Base Directory Specification**.

## Purpose

The XDG standard was created to de-clutter your home directory (`~/`). Instead of each application creating its own dotfile , modern applications place their settings inside a single folder.

This directory's structure **mirrors** the structure inside `~/.config/`.

## How It's Used

The subdirectories here are symlinked directly into your `~/.config/` directory.
