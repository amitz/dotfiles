# Lazy-load (autoload) Zsh function files from a directory.
fpath=(${ZDOTDIR}/zfunctions $fpath)
autoload -Uz ${ZDOTDIR}/.zfunctions/*(.:t)

# Setting zstyles
[[ ! -f ${ZDOTDIR}/.zstyles ]] || source ${ZDOTDIR}/.zstyles

# Create an amazing Zsh config using antidote plugins.
source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
antidote load

# Source anything in .zshrc.d.
for _rc in ${ZDOTDIR}/.zshrc.d/*.zsh; do
  # Ignore tilde files.
  if [[ $_rc:t != '~'* ]]; then
    source "$_rc"
  fi
done
unset _rc

# Set the default text editor, preferring nvim if available.
export EDITOR=$(command -v nvim || command -v vim)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source work-specific configurations if they exist.
[[ -f "${ZDOTDIR}/work/.zshrc" ]] && source "${ZDOTDIR}/work/.zshrc"

# Starts Tmux
ensure_tmux_is_running
