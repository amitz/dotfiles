# fzf widgets (C-r, C-t, Alt-c, **<Tab>). Shared look: config/fzf/fzfrc.
(( $+commands[fzf] )) || return

# Read by fzf's widgets when sourced below, so set first. Not exported.
FZF_CTRL_R_OPTS="--with-nth=2.. --no-info
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

source <(fzf --zsh)
