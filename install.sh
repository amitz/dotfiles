#!/bin/zsh
# Link these dotfiles into place. Safe to re-run: existing correct links are
# left alone, anything else in the way is reported, never overwritten.
# Homebrew packages and macOS defaults are separate steps (see README).
set -eu

repo=${0:A:h}
config=${XDG_CONFIG_HOME:-$HOME/.config}

# link <source> <target>
link() {
  local src=$1 dst=$2
  if [[ -L $dst && ${dst:A} == ${src:A} ]]; then
    return
  elif [[ -e $dst || -L $dst ]]; then
    print -P "%F{yellow}skip%f $dst exists (expected a symlink to $src)"
  else
    ln -s "$src" "$dst"
    print -P "%F{green}link%f $dst -> $src"
  fi
}

# zsh reads ~/.zshenv before ZDOTDIR is set; everything else follows from it.
link "$repo/config/zsh/.zshenv" "$HOME/.zshenv"

# Each config/<tool> as a whole directory (Karabiner replaces karabiner.json on
# save, which would break a file-level symlink).
mkdir -p "$config"
for dir in "$repo"/config/*(/); do
  link "$dir" "$config/${dir:t}"
done

# Scripts into ~/.local/bin, kept a real directory so uv/pipx tools don't land in the repo.
mkdir -p "$HOME/.local/bin"
for script in "$repo"/bin/*(.x); do
  link "$script" "$HOME/.local/bin/${script:t}"
done

# Machine-local git identity, from the template (never overwritten).
if [[ ! -e $config/git-local ]]; then
  cp -R "$repo/config/git/local.example" "$config/git-local"
  print -P "%F{green}copy%f $config/git-local (edit name, emails, work hosts)"
fi
