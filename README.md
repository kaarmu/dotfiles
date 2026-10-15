# Dotfiles

Personal mise configuration for macOS, Ubuntu, and Fedora. Tools are managed
by mise; no system packages are declared.

## Set up a new machine

Install mise and ensure Git access to this repository, then run:

```sh
mise bootstrap --adopt git@github.com:kaarmu/dotfiles.git
```

Mise adopts the repository as a checkout at `~/.config/mise`, installs the
declared tools, and applies the dotfiles declared in `config.toml`.
The shell configuration is for Zsh; open a new Zsh session to activate mise.

## Repository layout

- `config.toml`: global tool versions and dotfile deployment rules.
- `dot_config/shell/.zshrc`: portable Zsh configuration.
- `dot_config/bat/config`: terminal-palette syntax highlighting.
- `dot_config/git/config`: delta pager and interactive diff settings.
- `dot_config/nvim/`: active Neovim configuration and native package lockfile.
- `dot_config/ghostty/`: shared Ghostty settings for macOS and Linux.
- `archive/neovim/`: previous lazy.nvim setup, retained for reference.

## Save and share changes

The deployed files are symlinked: edits to `~/.zshrc` and `~/.config/nvim`
change this checkout directly. Review and publish them with ordinary Git:

```sh
git status
git diff
git add <files>
git commit -m "Update dotfiles"
git push
```

Commit `nvim-pack-lock.json` together with deliberate Neovim package updates.

On another machine that adopted this repository, update and apply in one command:

```sh
mise bootstrap --adopt git@github.com:kaarmu/dotfiles.git --update
```

Alternatively, inside the checkout:

```sh
git pull --ff-only
mise bootstrap
```

The checkout lives at `~/.config/mise`. Run the Git commands from that directory.

This setup uses explicit Git commits and pulls. Automatic mise dotfile-history
sync is a separate repository model and is not enabled here. Local settings
belong in ignored `config.local.toml` files.

## Terminal colors

Ghostty selects Tomorrow (light) or Tomorrow Night (dark) from the system
appearance. Its shared config is deployed to `~/.config/ghostty/config.ghostty`
on macOS and Linux. Reload Ghostty with Cmd+Shift+, on macOS or Ctrl+Shift+,
on Linux. A macOS-only config in `~/Library/Application Support/com.mitchellh.ghostty/`
can override the shared settings; keep personal overrides there if needed.

Neovim uses its built-in default colorscheme with true color disabled, so its
colors come from Ghostty's ANSI palette. Leave Neovim's `background` unset:
it detects the terminal background and adjusts its highlights automatically.
Refocusing Neovim requests the current terminal background again.
Bat and delta also use the terminal palette. Delta supports diff navigation
with n and N. Jq uses its default terminal colors and disables colors when
piped; no separate jq configuration is needed.

## Neovim

Requires Neovim 0.12 or newer. Plugins use only the built-in `vim.pack` manager;
there is no LSP, debugger, or Treesitter configuration. Leap follows its new
Codeberg repository. Use `:lua vim.pack.update()` to review package updates.
Commit the native lockfile with deliberate updates.

When migrating an existing installation, remove the old cached packages from
inside Neovim once (they are no longer loaded by this config):

```vim
:lua vim.pack.del({ 'mason.nvim', 'nvim-lspconfig', 'vague.nvim' })
```

The leader key is backslash (`\`). Useful mappings:

| Mapping | Action |
| --- | --- |
| `-` | Oil in the current window, like vinegar |
| `\e` | Oil in a narrow left split (files open in that split) |
| `s` | Leap in normal, visual, or operator-pending mode |
| `\ff` / `\fb` | Find files / buffers |
| `\fg` | Search file contents (requires `rg` or `git`) |
| `\h` | Search help |
| `\ac` / `:Codex` | Toggle Codex in a right sidebar |
| `\aa` / `:Claude` | Toggle Claude in the same sidebar |
| `\o` | Save the current file and reload the config |

Mise installs the native `codex` and `claude` CLIs as part of bootstrap.
On an existing machine, run `mise install codex claude` after updating the
repository. Upgrade them with `mise upgrade codex claude`; Claude background
auto-updates are disabled so mise controls its installed version. Sign in to
each CLI separately on each machine; authentication stays with each tool.
The sidebar uses Neovim's built-in terminal and does not require an AI plugin or send buffer contents on its own.
Each working directory gets separate Codex and Claude processes. Switching or
hiding a sidebar keeps its process alive until it exits or Neovim quits.

Inside an AI terminal, Esc reaches the tool normally. Ctrl+] enters Neovim
normal mode to scroll, search, and yank; `i` resumes terminal input and `q`
hides the pane. Ctrl+W followed by h/j/k/l moves to another editor window.
Outside the terminal, use normal Vim window commands. External file changes
are checked when returning from terminal mode or refocusing the editor;
unsaved buffers are not silently overwritten.

A typical workflow is to open Neovim from the project root, save files with
`:wa`, open either sidebar, and ask the tool to inspect or change files on disk.
Return to the editor with Ctrl+W h, then use `:Git diff` to review the changes.
The sidebar does not automatically attach your current file or selection;
mention the file path or paste relevant text in your prompt when needed.

Delta is pinned to 0.18.2 for Intel macOS compatibility; bat and jq track latest.

Git identity and credentials remain in `~/.gitconfig`, which takes precedence
over the shared Git settings.
