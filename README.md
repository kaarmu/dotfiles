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

Bat and delta use the terminal ANSI palette, so colors follow your terminal's
light/dark theme without a fixed background. Configure your terminal to follow
the system theme if desired. Delta supports diff navigation with n and N.
Jq uses its default terminal colors and disables colors when piped; no separate
jq configuration is needed. Git identity and credentials remain in ~/.gitconfig,
which takes precedence over the shared Git settings.

Delta is pinned to 0.18.2 for Intel macOS compatibility; bat and jq track latest.
