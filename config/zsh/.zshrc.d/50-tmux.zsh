# Helper function to check if we are currently outside of a tmux session.
# Returns true (0) if the $TMUX environment variable is not set.
_not_inside_tmux() {
    [[ -z "$TMUX" ]]
}

# Main function to start tmux.
# If we are not already inside a tmux session, it calls the 'tat' script.
function ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}
