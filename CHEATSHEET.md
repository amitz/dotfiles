# Cheat Sheet

Custom keybindings and commands from these dotfiles. Defaults are only listed
where they are worth remembering.

- [tmux](#tmux)
- [zsh](#zsh)
- [Neovim](#neovim)
- [git](#git)

---

## tmux

[`config/tmux/tmux.conf`](./config/tmux/tmux.conf). **Prefix:** `C-s`.
`prefix ?` lists every binding. Status bar: CPU, battery, session.

| Keys                    | Action                                                      |
| ----------------------- | ----------------------------------------------------------- |
| `prefix C-s`            | Send a literal `C-s`                                        |
| `prefix R`              | Reload `tmux.conf`                                          |
| `prefix -` / `prefix \` | Split top/bottom / left/right (in the current directory)    |
| `prefix c`              | New window (in the current directory)                       |
| `C-h` `C-j` `C-k` `C-l` | Move to the pane/nvim split left/down/up/right (not when zoomed) |
| `prefix C-l`            | Clear the screen (`C-l` is navigation)                      |
| `S-Arrow`               | Resize the pane (no prefix, hold to repeat)                 |
| `prefix o`              | Open the pane's directory in Finder                         |
| `prefix T`              | Session picker (sesh)                                       |
| `prefix Space`          | Previous session (even after it was killed)                 |
| `prefix G` + letter     | Git pickers in any pane, same letters as zsh's [`C-g`](#git-pickers-fzf-git) |
| `prefix F` / `prefix J` | Hints: copy a match / jump to it ([below](#hints-tmux-fingers)) |
| `prefix I` / `U` / `M-u`| TPM: install / update / remove unlisted plugins             |

Replaced defaults: `prefix o` (next pane), `prefix -` (delete buffer),
`prefix T` (pane title), `prefix Space` (next layout). Lowercase `prefix g` is
still tmux's floating-pane menu.

### Sessions (sesh)

Inside the `prefix T` picker:

| Keys            | Action                                        |
| --------------- | --------------------------------------------- |
| `Enter`         | Connect (creates the session if needed)       |
| `Tab` / `S-Tab` | Move down / up                                |
| `C-a` / `C-t` / `C-g` / `C-x` | Show all / tmux sessions / `sesh.toml` / zoxide folders |
| `C-f`           | Find a folder under `~` (2 levels)            |
| `C-d`           | Kill the highlighted session (no confirmation) |

Killing the current session switches you to another (`detach-on-destroy off`).
From a shell: `sesh connect <path>`, or `sesh mkdir <path>` to create it too.

### Copy mode (vi)

| Keys      | Action                                                  |
| --------- | ------------------------------------------------------- |
| `prefix [`| Enter (or mouse wheel up)                               |
| `v` / `C-v` | Start selection / toggle rectangle                    |
| `y`       | Copy to the system clipboard and exit                   |
| `/` / `?` | Incremental search down / up                            |

Mouse drag, double-click and triple-click copy too.

### Hints (tmux-fingers)

Labels paths, URLs, SHAs, IPs, UUIDs, numbers, k8s resources and git output.

- `prefix F`: press a label to **copy** that item. `C-`label opens it
  (browser/Finder), `S-`label pastes it, `Tab` multi-selects.
- `prefix J`: press a label to **jump** the copy-mode cursor there, then select
  what you want around it (`v` … `y`).

---

## zsh

### Line editing (vi mode)

[`05-vi-mode.zsh`](./config/zsh/conf.d/05-vi-mode.zsh). Starts in insert mode; `Esc` for normal mode.

| Keys          | Action                                            |
| ------------- | ------------------------------------------------- |
| `C-a` / `C-e` | Start / end of line (insert mode)                 |
| `C-w` / `C-u` | Delete word / to start of line (insert mode)      |
| `v`           | Edit the line in nvim; save and quit runs it (normal mode) |
| `C-y`         | Accept the autosuggestion (`→` too; `Esc w` word by word) |
| `Tab`         | Completion menu, move with `hjkl` or arrows, `Esc` cancels |

`C-Space` is left to macOS (input language).

### fzf

[`40-fzf.zsh`](./config/zsh/conf.d/40-fzf.zsh), look in [`fzfrc`](./config/fzf/fzfrc).
In tmux it opens as a floating pane.

| Keys          | Action                                                      |
| ------------- | ----------------------------------------------------------- |
| `C-r`         | History (`C-r` again toggles sort, `C-y` copies the command) |
| `C-t`         | Insert file/folder paths (`Tab` marks several)              |
| `Alt-c`       | `cd` into a folder (left Option key)                        |
| `**` `Tab`    | Fuzzy completion: `nvim **<Tab>`, `kill **<Tab>`            |

Search syntax: `'exact`, `^start`, `end$`, `!exclude`, `a | b`.

### Git pickers (fzf-git)

`C-g`, release, then a letter. The pick is inserted at the cursor. Also on
tmux `prefix G` + letter in any pane (e.g. inside nvim).

| Letter | Picks                                     | Letter | Picks       |
| ------ | ----------------------------------------- | ------ | ----------- |
| `b`    | Branches (`Alt-a`: include remotes)       | `t`    | Tags        |
| `f`    | Changed files (outside a repo: any file)  | `r`    | Remotes     |
| `h`    | Commit hashes (`Alt-a`: all branches)     | `l`    | Reflog      |
| `s`    | Stashes (`C-x` drops)                     | `w`    | Worktrees (`C-x` removes) |
| `e`    | Every ref                                 | `?`    | List these  |

Inside: `Tab` marks, `C-/` changes the preview, `C-o` opens on GitHub.
Example: `git switch ` then `C-g b`.

### cd (zoxide)

`cd` remembers folders and ranks them by frequency and recency.
[`45-zoxide.zsh`](./config/zsh/conf.d/45-zoxide.zsh)

| Command               | Action                                         |
| --------------------- | ---------------------------------------------- |
| `cd foo`              | Real path, else the best-ranked match for `foo` |
| `cd foo bar`          | Several keywords, in order                     |
| `cd foo` `Space` `Tab`| Pick from the matches in fzf                   |
| `cdi`                 | Pick from every known folder                   |
| `zoxide remove <dir>` | Forget a folder                                |

### Node (fnm)

[`50-fnm.zsh`](./config/zsh/conf.d/50-fnm.zsh). `cd` into a folder with
`.nvmrc` / `.node-version` switches automatically (that folder only, not parents).

| Command             | Action                                           |
| ------------------- | ------------------------------------------------ |
| `fnm install --lts` / `fnm install 22` | Install a version              |
| `fnm default 22`    | Version for new shells                           |
| `fnm use [22]`      | Switch this shell (no arg: from `.nvmrc` here)   |
| `fnm list` / `fnm current` | Installed / in use                        |

Global `npm i -g` packages belong to one Node version; `pnpm add -g` ones don't.

### Python (uv)

No shell hook: nothing runs at shell startup.

| Command                   | Action                                         |
| ------------------------- | ---------------------------------------------- |
| `uv python install 3.12`  | Install a Python version                       |
| `uv python pin 3.12`      | Write `.python-version` here                   |
| `uv venv` / `uv sync`     | Create `.venv` / install the project's deps    |
| `uv run <cmd>`            | Run in the project's `.venv` (no activate)     |
| `source .venv/bin/activate` | Activate by hand                             |
| `uv tool install ruff`    | Global CLI tool (pipx replacement)             |

### Aliases

[`90-alias.zsh`](./config/zsh/conf.d/90-alias.zsh)

| Alias         | Runs                                                   |
| ------------- | ------------------------------------------------------ |
| `vim` / `vi`  | `nvim`                                                 |
| `ls`          | `gls --color=auto` (GNU ls)                            |
| `ff foo`      | `fd --type f foo`: files by partial name (`-H` hidden) |
| `todo`        | `nvim ~/Documents/todo`                                |
| `docker-test` | Build the Dockerfile here, then remove the image       |

---

## Neovim

[`config/nvim`](./config/nvim). **Leader:** `Space`; wait a second for which-key.

### General

| Keys                    | Action                                                    |
| ----------------------- | --------------------------------------------------------- |
| `C-h` `C-j` `C-k` `C-l` | Move to the split / tmux pane                             |
| `<leader>-` / `<leader>=` | Zoom the split / equalize splits                        |
| `<leader>q`             | Line diagnostics in a float, cursor inside (`Esc` closes) |
| `Esc`                   | Clear search highlights                                   |
| `\`                     | File explorer (oil): edit names, `:w` applies, `-` parent, `g.` hidden |
| `F8`                    | Format the buffer or selection                            |
| `:W`                    | `:w` (typo guard)                                         |
| `<leader>slp`           | Insert a 1-second sleep (Python, TypeScript)              |

### Search (fzf-lua)

[`picker.lua`](./config/nvim/lua/plugins/picker.lua). Same ripgrep config as the shell.

| Keys               | Search                                    |
| ------------------ | ----------------------------------------- |
| `<leader>sf`       | Files                                     |
| `<leader>sg`       | Live grep                                 |
| `<leader>sw`       | Word under cursor (Visual: selection)     |
| `<leader><leader>` | Open buffers                              |
| `<leader>/` / `s/` | Lines in this buffer / all open buffers   |
| `<leader>s.`       | Recent files                              |
| `<leader>sd`       | Diagnostics in this file                  |
| `<leader>sr`       | Resume the last search                    |
| `<leader>sh` / `sk` / `sc` | Help / keymaps / commands         |
| `<leader>sn`       | Neovim config files                       |
| `<leader>ss`       | Every picker                              |

### LSP

[`lsp.lua`](./config/nvim/lua/plugins/lsp.lua). Neovim's built-in keys; lists open in fzf-lua.

| Keys          | Action                                     |
| ------------- | ------------------------------------------ |
| `K`           | Hover docs                                 |
| `grd` / `grD` | Definition / declaration (`C-o` back)      |
| `grr`         | References                                 |
| `gri` / `grt` | Implementations / type definition          |
| `grn`         | Rename                                     |
| `gra`         | Code actions                               |
| `gO` / `gW`   | Symbols in this file / workspace           |
| `]d` / `[d`   | Next / previous diagnostic                 |
| `<leader>th`  | Toggle inlay hints                         |

`F8` formats on demand (never on save):

| Filetype   | Formatter                                                    |
| ---------- | ------------------------------------------------------------ |
| TypeScript | Prettier (only with a Prettier config), then ESLint fixes    |
| JSON       | Prettier (only with a Prettier config), else jsonls          |
| Python     | ruff: fixes, import sort, format                             |
| Lua        | stylua                                                       |
| Groovy     | npm-groovy-lint `--fix` (rules: `config/groovylint`)         |
| Others     | The LSP's formatter, if any                                  |

### Completion (blink.cmp)

| Keys          | Action                                        |
| ------------- | --------------------------------------------- |
| `C-y`         | Accept                                        |
| `C-n` / `C-p` | Next / previous                               |
| `C-d`         | Toggle the item's docs (signature, JSDoc)     |
| `C-b` / `C-f` | Scroll the docs                               |
| `C-e`         | Close the menu                                |
| `C-k`         | Toggle signature help (also shows on its own) |

### Editing (mini.nvim)

[`editing.lua`](./config/nvim/lua/plugins/editing.lua)

| Keys               | Action                                          |
| ------------------ | ----------------------------------------------- |
| `sa{motion}{char}` | Add surrounding: `saiw)`                        |
| `sd{char}`         | Delete surrounding: `sd'`                       |
| `sr{old}{new}`     | Replace surrounding: `sr)]`                     |
| `cr{motion}`       | Replace with register: `criw`, `crr` = line     |
| `gs{motion}`       | Sort: `gsip` (Visual: `gs`)                     |
| `an` / `in`        | Grow / shrink selection by syntax node (Visual) |

Text objects (with `d` `c` `y` `v`): `q` quotes, `b` brackets, `a` argument,
`f` call, `F` function definition, `c` class, `e` whole buffer, `ih` git hunk.
Add `N` / `L` for the next / last one: `ciNq`.

### Git hunks (gitsigns)

[`git.lua`](./config/nvim/lua/plugins/git.lua)

| Keys                | Action                                              |
| ------------------- | --------------------------------------------------- |
| `]c` / `[c`         | Next / previous change                              |
| `<leader>hp` / `hi` | Preview the hunk (float / inline)                   |
| `<leader>hs` / `hr` | Stage (again = unstage) / reset hunk (Visual: lines) |
| `<leader>hS` / `hR` | Stage / reset the file                              |
| `<leader>hb`        | Blame the file                                      |
| `<leader>hd` / `hD` | Diff against index / last commit                    |
| `<leader>hq` / `hQ` | Hunks to quickfix (file / repo)                     |
| `<leader>tb` / `tw` | Toggle line blame / word diff                       |

### Plugins

| Command                        | Action                                      |
| ------------------------------ | ------------------------------------------- |
| `:lua vim.pack.update()`       | Review updates, `:w` applies, `:q` cancels  |
| `:lua vim.pack.del { 'name' }` | Remove a plugin (after deleting its `add` and `:restart`) |
| `:checkhealth vim.pack`        | Lists inactive plugins to delete            |
| `:Mason` / `:ConformInfo`      | LSP servers and tools / formatters for this file |

---

## git

[`config/git/config`](./config/git/config). Diffs go through delta (`n` / `N` jump between files).

| Alias            | Runs                                         |
| ---------------- | -------------------------------------------- |
| `git aa`         | `add --all`                                  |
| `git amend`      | `commit --amend --no-edit`                   |
| `git uncommit`   | `reset --soft HEAD^` (keeps the changes)     |
| `git dc`         | `diff --cached`                              |
| `git sl` / `sla` | Last 20 commits / all branches as a graph    |
| `git copysha`    | Copy HEAD's SHA to the clipboard             |
| `git conflicts`  | Open the conflict view in nvim               |
| `git gone`       | Delete branches whose remote is gone (unpushed commits on them too) |

Settings worth knowing: plain `git push` creates the remote branch;
`git branch` lists recent first; rebase auto-stashes and moves stacked branches;
resolved conflicts are remembered (rerere). Side-by-side once:
`git -c delta.side-by-side=true diff`.

### Diff & conflicts in nvim (diffview)

| Keys         | Action                                               |
| ------------ | ---------------------------------------------------- |
| `<leader>gd` | Diff working tree; during a merge, the conflict view |
| `<leader>gm` | Diff vs `origin/HEAD` (what the MR shows)            |
| `<leader>gh` | History of the file (Visual: of the lines)           |
| `<leader>gH` | History of the branch                                |
| `<leader>gq` | Close                                                |

Conflict view: **ours | theirs** on top, **result** below.

| Keys            | Action                                    |
| --------------- | ----------------------------------------- |
| `]x` / `[x`     | Next / previous conflict                  |
| `<leader>co` / `ct` / `cb` / `ca` | Take ours / theirs / base / all |
| `dx`            | Delete the conflict region                |
| `Tab` / `S-Tab` | Next / previous file                      |
| `-`             | Stage / unstage the file (file panel)     |

Then `:w`, `<leader>gq`, `git commit`.
