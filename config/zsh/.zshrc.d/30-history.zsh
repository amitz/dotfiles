# Set the path to the history file, keeping it inside the Zsh config directory.
HISTFILE=${ZDOTDIR}/.zsh_history

# Set history size in memory and the size of the history file.
HISTSIZE=10000
SAVEHIST=10000

# Set various history-related options for a better experience.
setopt APPEND_HISTORY EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_VERIFY INC_APPEND_HISTORY SHARE_HISTORY
