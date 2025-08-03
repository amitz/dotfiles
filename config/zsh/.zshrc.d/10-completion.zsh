FPATH="$HOME/.docker/completions:$FPATH"

# Initializes the completion system. This must run before any file that uses 'compdef' or other completion features.
autoload -Uz compinit
compinit
