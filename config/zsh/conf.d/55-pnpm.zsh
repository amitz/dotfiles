# pnpm, standalone installer (brew's pnpm pulls brew's node, which fights fnm).
# Don't re-run `pnpm setup` (appends to .zshrc) or use `pnpm env` (fights fnm).
export PNPM_HOME=$XDG_DATA_HOME/pnpm
path=($PNPM_HOME/bin(N) $path)
