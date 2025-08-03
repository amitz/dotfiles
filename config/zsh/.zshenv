# Using XDG directory structure for portability
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

export LC_TIME="en_US.UTF-8" # Use standard English date formatting for things like ls -la
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Source work-specific configurations if they exist.
[[ -f "${ZDOTDIR}/work/.zshenv" ]] && source "${ZDOTDIR}/work/.zshenv"
