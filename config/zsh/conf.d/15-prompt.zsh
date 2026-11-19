# Pure prompt. Catppuccin Mocha colors, following catppuccin/starship
# (parts Starship doesn't style use the closest palette color).

zstyle ':prompt:pure:prompt:success'      color '#fab387' # peach
zstyle ':prompt:pure:prompt:error'        color '#f38ba8' # red
zstyle ':prompt:pure:prompt:continuation' color '#7f849c' # overlay1
zstyle ':prompt:pure:path'                color '#b4befe' # lavender
zstyle ':prompt:pure:git:branch'          color '#cba6f7' # mauve
zstyle ':prompt:pure:git:branch:cached'   color '#f38ba8' # red
zstyle ':prompt:pure:git:dirty'           color '#f9e2af' # yellow
zstyle ':prompt:pure:git:action'          color '#eba0ac' # maroon
zstyle ':prompt:pure:git:arrow'           color '#89dceb' # sky
zstyle ':prompt:pure:git:stash'           color '#89dceb' # sky
zstyle ':prompt:pure:execution_time'      color '#f9e2af' # yellow
zstyle ':prompt:pure:suspended_jobs'      color '#f38ba8' # red
zstyle ':prompt:pure:virtualenv'          color '#7f849c' # overlay1
zstyle ':prompt:pure:user'                color '#7f849c' # overlay1
zstyle ':prompt:pure:host'                color '#7f849c' # overlay1

# Show ≡ when the repo has stashes (off by default in Pure).
zstyle ':prompt:pure:git:stash' show yes

autoload -Uz promptinit
promptinit
prompt pure
