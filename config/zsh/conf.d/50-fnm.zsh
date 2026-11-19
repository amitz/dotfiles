# fnm (Node versions), switches on cd into a folder with .nvmrc / .node-version.
# Not cached: `fnm env` makes a per-shell symlink so each pane has its own version.
if (( $+commands[fnm] )); then
  eval "$(fnm env --use-on-cd --resolve-engines=false --shell zsh)"

  # fnm never removes that symlink; do it on exit (missed on kill -9 / crash).
  autoload -Uz add-zsh-hook
  _fnm_cleanup() { [[ -n $FNM_MULTISHELL_PATH ]] && rm -f -- $FNM_MULTISHELL_PATH }
  add-zsh-hook zshexit _fnm_cleanup
fi
