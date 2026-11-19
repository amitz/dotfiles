fpath=(~/.docker/completions(N) $fpath) # Docker Desktop, if installed

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump" # keep the dump out of the repo

# Tab menu, navigable with hjkl (needs zsh/complist).
zmodload zsh/complist
zstyle ':completion:*' menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^[' send-break

# Same colors as gls. ma= (selected item): Crust on Mauve, the prompt's branch color.
(( $+commands[gdircolors] )) && eval "$(gdircolors -b)"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}" 'ma=1;38;2;17;17;27;48;2;203;166;247'
