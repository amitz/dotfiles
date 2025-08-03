# Better defaults
alias vim='nvim'
alias vi='nvim'
alias ripgrep='rg'
alias ls='gls --color' # Respects Iterm2 themes LSColors settins for directories, files etc (where normal 'ls' wont)

# Find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# Directories
alias todo='nvim ~/Documents/todo'

# Docker
alias docker-test='docker build -t temp-image-for-test . && docker rmi temp-image-for-test'

# Alias 'g' to 'git', running 'git status' when called with no arguments.
function g {
  if [[ $# -gt 0 ]]; then
    command git "$@"
  else
    command git status --short --branch
  fi
}
# Enable git command completion for the 'g' function.
compdef g=git
