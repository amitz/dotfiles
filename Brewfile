# Everything these dotfiles depend on. Install / check:
#   brew bundle --file ./Brewfile
#   brew bundle check --file ./Brewfile

# The only third-party tap, so Homebrew needs explicit trust; scoped to this one formula.
tap "morantron/tmux-fingers", trusted: { formulae: ["tmux-fingers"] }

# --- Core ---
brew "neovim"
brew "tree-sitter-cli"          # nvim-treesitter builds parsers with it
brew "tmux"
brew "sesh"                     # tmux session picker
brew "morantron/tmux-fingers/tmux-fingers" # binary for the tmux-fingers plugin

# --- Zsh plugins (sourced from config/zsh, no plugin manager) ---
brew "pure"
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"

# --- CLI tools ---
brew "coreutils"                # gls, gdircolors
brew "fd"
brew "fzf"
brew "zoxide"
brew "bat"                      # fzf previews
brew "tree"                     # fzf folder previews
brew "ripgrep"
brew "git-delta"                # git pager
brew "fnm"                      # Node versions
brew "uv"                       # Python versions, venvs, tools; runs bin/grove
brew "openjdk@21"               # Groovy tools in nvim (JAVA_HOME: .zprofile)

# --- Apps ---
cask "ghostty"
cask "karabiner-elements"

# Not here: pnpm (standalone installer as I prefer to use their script, see config/zsh/conf.d/55-pnpm.zsh).
