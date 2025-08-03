# Initialize Zsh's color module to enable variables like $fg[red].
autoload -U colors
colors

# Enable colored output for CLI tools (ls, grep, etc.).
export CLICOLOR=1

# set zsh-autosuggestions color (specifically set for Catppuccin theme, so if I'll switch theme, reconsider this)
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=250' # White
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=183' # Lavander

# Catppuccin has zsh-syntax-highliting. It color '/' in red, so those highligh styles disable it
_catppuccin_theme_dir=$(antidote path catppuccin/zsh-syntax-highlighting)
if [[ -f "${_catppuccin_theme_dir}/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh" ]]; then
  source "${_catppuccin_theme_dir}/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh"
  ZSH_HIGHLIGHT_STYLES[path_pathseparator]='none'
  ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='none'
fi
