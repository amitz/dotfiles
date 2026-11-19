HISTFILE=$XDG_STATE_HOME/zsh/history # state, not config: keep it out of the repo
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY        # write immediately, read other shells' commands (tmux panes)
setopt EXTENDED_HISTORY     # timestamp + duration
setopt HIST_IGNORE_ALL_DUPS # re-running a command drops its older copy
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE    # leading space = not saved (secrets)
setopt HIST_VERIFY          # !! / !$ fill the line instead of running
