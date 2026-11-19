# zsh-autosuggestions: ghost text from history. C-y accepts (same key as nvim).
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6c7086' # Catppuccin Overlay0
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey -M viins '^Y' autosuggest-accept
