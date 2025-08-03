# Accept zsh-autosuggestions suggestion with Ctrl+Space.
bindkey '^ ' autosuggest-accept

# (Ctrl+X Ctrl+Y) - Copy the last command to the clipboard.
function _pbcopy_last_command(){
  history | tail -1 | sed 's/ *[0-9]* *//' | pbcopy && \
    tmux display-message "Previous command copied to clipboard"
}
zle -N pbcopy-last-command _pbcopy_last_command
bindkey '^x^y' pbcopy-last-command

# (Ctrl+G Ctrl+B) - Fuzzy-find a git branch and insert its name.
_fuzzy_git_branches() {
  zle -U "$(
    git branch --color=always --sort=-committerdate | \
    grep -v '^* ' | \
    grep -v '^\s\+master' | \
    grep -v '^\s\+develop' | \
    grep -v '^\s\+development' | \
    fzf --reverse --ansi --select-1 --multi | \
    xargs echo | \
    sed -E 's/^[ \t]*//'
  )"
}
zle -N fuzzy-git-branches _fuzzy_git_branches
bindkey '^g^b' fuzzy-git-branches

# (Ctrl+G Ctrl+F) - Fuzzy-find a changed git file and insert its name.
_fuzzy_git_status_files() {
  zle -U "$(
    git -c color.status=always status --short | \
    fzf --ansi --reverse --no-sort --multi | \
    cut -d ' ' -f 3
  )"
}
zle -N fuzzy-git-status-files _fuzzy_git_status_files
bindkey '^g^f' fuzzy-git-status-files

# (Ctrl+G Ctrl+G) - Fuzzy-find a git commit and insert its SHA.
_fuzzy_git_shalector() {
  commit=$(
    git log --color=always --oneline --decorate -35 | \
    fzf --ansi --reverse --no-sort
  )
  zle -U "$(echo $commit | cut -d ' ' -f 1)"
  zle -M "$commit"
}
zle -N fuzzy-git-shalector _fuzzy_git_shalector
bindkey '^g^g' fuzzy-git-shalector
