# zoxide replaces `cd` (frecency jumps, `cdi` picker). Needs compinit (10-) first.
(( $+commands[zoxide] )) && eval "$(zoxide init zsh --cmd cd)"
