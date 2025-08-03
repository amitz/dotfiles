<div align="center">

  # Dotfiles

  My macos dotfiles

  [comment]: <> (Badges takes from https://simpleicons.org)
  [![Static Badge](https://img.shields.io/badge/Zsh-1C1F2E?style=for-the-badge&logo=zsh)](./config/zsh)
  [![Static Badge](https://img.shields.io/badge/Tmux-1C1F2E?style=for-the-badge&logo=tmux)](./apps/tmux)
  [![Static Badge](https://img.shields.io/badge/iTerm2-1C1F2E?style=for-the-badge&logo=iterm2)](./apps/iterm2)
  [![Static Badge](https://img.shields.io/badge/Neovim-1C1F2E?style=for-the-badge&logo=neovim)](./config/neovim)
  [![Static Badge](https://img.shields.io/badge/Macos-1C1F2E?style=for-the-badge&logo=macos)](./macos)
</div>

---

The repository is organized to separate configurations by their purpose, making them easy to manage and symlink into place.

* `bin/`: Contains custom, executable scripts that I want available in my `$PATH`. (normally `~/.local/bin`)
* `config/`: Holds configurations that belong in `~/.config`, following the XDG standard. For example, `config/nvim` is symlinked to `~/.config/nvim`.
* `modules/`: Contains configurations for specific applications. Each subdirectory here corresponds to a piece of software (e.g., Git, tmux). The files inside are typically linked directly into the home directory (e.g., `modules/tmux/tmuxconf` -> `~/.tmux.conf`).
* `macos/`: Contains scripts to set macOS `defaults`.
