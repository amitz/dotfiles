# Read by every zsh (login, interactive, scripts). Symlinked to ~/.zshenv:
# zsh reads it before ZDOTDIR is set, so this is the one fixed-path file.

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

export LC_TIME="en_US.UTF-8" # English date formats (ls -l, date)
export EDITOR=nvim
export VISUAL=nvim

# Tool configs. Here rather than .zshrc so non-interactive shells (tmux popups, nvim) see them.
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/fzfrc"
export BAT_THEME="Catppuccin Mocha" # bat, fzf previews and delta

# No duplicates in path/fpath. PATH itself is set in .zprofile.
typeset -gU path fpath

# Machine-local env (not tracked).
[[ -f $XDG_CONFIG_HOME/zsh-local/env.zsh ]] && source $XDG_CONFIG_HOME/zsh-local/env.zsh
