<div align="center">

  # Dotfiles

  My macOS dotfiles

  [comment]: <> (Badges from https://simpleicons.org)
  [![Static Badge](https://img.shields.io/badge/Zsh-1C1F2E?style=for-the-badge&logo=zsh)](./config/zsh)
  [![Static Badge](https://img.shields.io/badge/Tmux-1C1F2E?style=for-the-badge&logo=tmux)](./config/tmux)
  [![Static Badge](https://img.shields.io/badge/Ghostty-1C1F2E?style=for-the-badge&logo=ghostty)](./config/ghostty)
  [![Static Badge](https://img.shields.io/badge/Neovim-1C1F2E?style=for-the-badge&logo=neovim)](./config/nvim)
  [![Static Badge](https://img.shields.io/badge/Macos-1C1F2E?style=for-the-badge&logo=macos)](./macos)
</div>

---

* `config/`: one folder per tool, each symlinked into `~/.config/` ([XDG](https://specifications.freedesktop.org/basedir-spec/latest/)).
* `bin/`: personal scripts, symlinked into `~/.local/bin`. Docs next to each script (e.g. [`grove.md`](./bin/grove.md)).
* `macos/`: system settings ([`defaults.sh`](./macos/defaults.sh)) and notes.
* [`Brewfile`](./Brewfile): every tool and app the configs depend on.
* [`install.sh`](./install.sh): creates the symlinks.
* [`CHEATSHEET.md`](./CHEATSHEET.md): custom keybindings and commands.

## Installation

Clone anywhere, then from the repo root:

```sh
brew bundle --file ./Brewfile   # Homebrew from https://brew.sh first
./install.sh                    # symlinks; safe to re-run, never overwrites
macos/defaults.sh               # review first; then the "Set by hand" list in macos/README.md
```

No admin rights needed: everything installs under `/opt/homebrew` or `$HOME`
(e.g. the JDK is Homebrew's `openjdk@21`, not a `.pkg`).

`install.sh` links `~/.zshenv`, every `config/<tool>` into `~/.config/`, every
`bin/` script into `~/.local/bin`, and copies the git identity template to
`~/.config/git-local/`. Anything already in the way is reported as `skip`:
move it aside and re-run.

Karabiner creates a real `~/.config/karabiner` on first launch. Remove it, re-run
`install.sh`, then restart Karabiner:
`launchctl kickstart -k gui/$(id -u)/org.pqrs.service.agent.karabiner_console_user_server`.

First run, once:

* `fnm install --lts`: Node (nvim's LSP servers need it).
* `curl -fsSL https://get.pnpm.io/install.sh | sh -`: pnpm, standalone (not brew, see `55-pnpm.zsh`).
  It appends a block to `.zshrc`; delete it, `55-pnpm.zsh` already sets it up.
* Open `nvim`: plugins install from the lockfile, Mason installs LSP servers and tools.
* Edit `~/.config/git-local/` (name, emails, work hosts).

## Zsh

```
.zshenv     every shell: XDG vars, ZDOTDIR, tool env vars
.zprofile   login shells: Homebrew + ~/.local/bin on PATH
.zshrc      interactive: fpath, conf.d loop, syntax highlighting (last)
conf.d/     sourced in numeric order; ~name.zsh is skipped
```

No plugin manager: pure, zsh-autosuggestions and zsh-syntax-highlighting come
from Homebrew and are sourced directly.

## Neovim

```
init.lua              leader, core, plugin list (comment a line to disable)
nvim-pack-lock.json   plugin versions (vim.pack, built into Neovim 0.12+)
lua/core/             options, keymaps, autocmds, commands
lua/plugins/          one file per role: vim.pack.add() + setup() + keymaps
after/ftplugin/       per-filetype indent and buffer maps
after/lsp/            per-server settings over nvim-lspconfig's defaults
```

## Machine-local config (not tracked)

```
~/.config/zsh-local/
  env.zsh       sourced by .zshenv (env vars, tokens; chmod 600)
  conf.d/*.zsh  sourced after the public conf.d/
  functions/    autoloaded, one file per function

~/.config/git-local/        from config/git/local.example
  config        [user] name + includeIf: remote URL -> work / personal
  work          email, signing key
  personal      email
```

Check which identity a repo gets: `git config --show-origin user.email`.

## Credits

| What | Author / License | Where |
| ---- | ---------------- | ----- |
| [fzf-git.sh](https://github.com/junegunn/fzf-git.sh) | Junegunn Choi, MIT ([LICENSE](./config/fzf/fzf-git/LICENSE)) | [`config/fzf/fzf-git/`](./config/fzf/fzf-git/), vendored unmodified |
| [Catppuccin zsh-syntax-highlighting](https://github.com/catppuccin/zsh-syntax-highlighting) | Catppuccin, MIT | [`99-syntax-highlighting.zsh`](./config/zsh/conf.d/99-syntax-highlighting.zsh) |
| [Catppuccin fzf](https://github.com/catppuccin/fzf) | Catppuccin, MIT | [`config/fzf/fzfrc`](./config/fzf/fzfrc) |
