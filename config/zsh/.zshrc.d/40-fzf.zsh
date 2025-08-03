# ==============================================================================
# FZF (Fuzzy Finder) Configuration
# ==============================================================================

# Source FZF's completion and keybinding setup.
# This is loaded only in interactive shells via the .zshrc.d directory.
source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

# --- FZF Options ---

# Set default options for FZF's appearance.
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# --- Custom Keybindings ---

# Override the default CTRL-R history search to remove leading line numbers.
# This prevents editing fzf's source files, which would be overwritten on update.
fzf-history-widget-custom() {
  local selected
  selected="$(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' | awk '{$1="";print $0}' | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd))"
  LBUFFER=$selected
}
zle -N fzf-history-widget-custom
bindkey '^R' fzf-history-widget-custom
