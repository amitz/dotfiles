# ==============================================================================
# FZF (Fuzzy Finder) Configuration
# ==============================================================================

# Source FZF's completion and keybinding setup.
# This is loaded only in interactive shells via the .zshrc.d directory.
source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

# Using fd instead of find as it's faster (CTRL+T)
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Set default options for FZF's appearance.
export FZF_CTRL_R_OPTS="--height 40% --reverse --border --with-nth=2.. --no-info"
