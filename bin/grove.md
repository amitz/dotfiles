# grove

Multi-repo `git worktree` manager: creates the same branch in several repos at
once, each checked out as a worktree under one shared folder.

```
~/repositories/worktrees/fix-login-bug/
  my-app/          worktree, branch fix-login-bug
  my-app-infra/    worktree, branch fix-login-bug
  AGENTS.md        scaffolding file (copied)
```

Needs [uv](https://docs.astral.sh/uv/) (`brew "uv"` in the Brewfile). The
script declares `requires-python >= 3.11`; uv provides that Python on first run.

## Quick start

```sh
grove init                         # writes ~/.config/grove/config.toml
$EDITOR ~/.config/grove/config.toml
grove fix-login-bug                # create
grove list                         # inspect
grove remove fix-login-bug         # tear down
```

## Commands

**`grove <branch> [-p PROFILE] [-d DIR]`** creates `<branch>` in every repo of
the profile (default: `default`), based on a fresh `origin/<default-branch>`.
The folder name is the branch with `/` replaced by `-`, or `DIR` if given:

```sh
grove BCE-0000/fix-login-bug -d fix-login-bug
```

All repos are checked first (git repo, fetch, default branch found, branch
not already there, scaffolding files exist). If any check fails, nothing is
created. If a worktree fails mid-way, the ones already made are rolled back.
The new branch has no upstream; the first `git push` creates it on origin
(`push.autoSetupRemote`).

**`grove list`** shows the config, profiles, and every worktree folder with
each repo's branch and HEAD.

**`grove remove <dir>`** takes the folder name from `grove list`:

- Runs `git worktree remove` per repo. Repos with uncommitted changes are
  skipped (exit code 1).
- Deletes files whose names match a scaffolding entry; any other file is kept.
- Removes the folder if it is empty.
- Then asks which branches to delete (digits toggle, `a` all, `Enter`
  confirm, `n`/`q` keep all). Non-interactive runs keep every branch.

**`grove init`** writes a sample config if none exists.

## Config

`$GROVE_CONFIG`, else `$XDG_CONFIG_HOME/grove/config.toml`. Machine-specific,
so it is not in this repo.

```toml
[defaults]
repos_dir     = "~/repositories"
worktrees_dir = "~/repositories/worktrees"

[profiles.default]
repos = ["my-app", "my-app-infra"]        # folder names under repos_dir
scaffolding = ["~/notes/AGENTS.md"]       # copied into each new folder; ~ and $VARS expand

[profiles.backend-only]
repos = ["my-app"]
```

Scaffolding files must have distinct basenames.

## Troubleshooting

| Error | Fix |
| ----- | --- |
| `Cannot detect default branch` | `git remote set-head origin --auto` in that repo |
| `Branch '…' already exists` | `git -C <repo> branch -D <branch>`, or pick another name |
| `Worktree wrapper already exists` | `grove remove <dir>` or use `-d` |
| `No config found` | `grove init` |
