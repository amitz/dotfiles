# Interactive shells only.

# zsh silently fails to write history/compdump if these are missing.
[[ -d $XDG_CACHE_HOME/zsh ]] || mkdir -p $XDG_CACHE_HOME/zsh
[[ -d $XDG_STATE_HOME/zsh ]] || mkdir -p $XDG_STATE_HOME/zsh

# Set by `brew shellenv` in login shells; fallback for shells started without one.
: ${HOMEBREW_PREFIX:=/opt/homebrew}

# Autoloaded functions, one file per function. Machine-local first so it wins.
fpath=(
  $XDG_CONFIG_HOME/zsh-local/functions(N)
  $ZDOTDIR/functions(N)
  $HOMEBREW_PREFIX/share/zsh/site-functions(N)
  $fpath
)
# A bare `autoload -Uz` (no names) would list every function, so guard it.
_fns=( $ZDOTDIR/functions/*(N.:t) $XDG_CONFIG_HOME/zsh-local/functions/*(N.:t) )
(( $#_fns )) && autoload -Uz $_fns
unset _fns

# conf.d in numeric order, then machine-local. Rename to ~name.zsh to disable.
for _rc in $ZDOTDIR/conf.d/*.zsh $XDG_CONFIG_HOME/zsh-local/conf.d/*.zsh(N); do
  [[ $_rc:t != '~'* ]] && source "$_rc"
done
unset _rc

# Must be last (plugin README): it wraps every ZLE widget defined so far.
# Styles: conf.d/99-syntax-highlighting.zsh.
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
