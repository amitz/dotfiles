# Set explicitly (zsh would infer it from $EDITOR). Must run before any other
# bindkey: a plain `bindkey` targets the current keymap.
bindkey -v
KEYTIMEOUT=10 # 0.1s: Esc feels instant, multi-key chords still work

# Emacs keys in insert mode, for anyone not fluent in vi mode.
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^?' backward-delete-char # Backspace past the insert point
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^U' backward-kill-line

# Normal mode `v`: edit the command line in $EDITOR.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line
