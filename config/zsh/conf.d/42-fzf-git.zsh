# fzf-git.sh pickers on C-g <letter> (vendored in config/fzf/fzf-git/).
(( $+commands[fzf] )) || return

# Free C-g (default list-expand) so zsh waits for the letter instead of
# timing out after KEYTIMEOUT.
bindkey -M viins -r '^G'
bindkey -M vicmd -r '^G'

source "$XDG_CONFIG_HOME/fzf/fzf-git/fzf-git.sh"
