My git, zsh, wezterm, nvim, starship and zed dot files.

## Setting up a new machine

1. Install Apple's command line tools and [Homebrew](https://brew.sh):
   ```bash
   xcode-select --install
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ```
2. Clone this repo to `~/.dotfiles` and install everything in the `Brewfile`:
   ```bash
   git clone git@github.com:Rafaelfferreira/dotfiles.git ~/.dotfiles
   brew bundle --file=~/.dotfiles/Brewfile
   ```
3. Install [Oh My Zsh](https://ohmyz.sh) without letting it overwrite `.zshrc`:
   ```bash
   KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
4. Symlink the configs with [GNU stow](https://www.gnu.org/software/stow/) (`.stowrc` sets the target to `~` and ignores `.DS_Store`). If stow reports a conflict, delete the default file it names and run it again:
   ```bash
   cd ~/.dotfiles && stow git nvim starship wezterm zed zsh
   ```
5. Open a new WezTerm window, then run `nvim` once so lazy.nvim installs the plugins.

## Secrets and machine-specific settings

This repo is public. Put API keys, tokens and anything specific to one Mac in `~/.zshrc.local`, which `.zshrc` loads if it exists. It lives outside the repo and is never committed (`.gitignore` also blocks `*.local` and `.env` files).

## Not managed here

nvm, ghcup, the Android SDK, Raycast settings (use Raycast's own export/import) and macOS system settings.

To refresh the `Brewfile` after installing new things: `brew bundle dump --file=~/.dotfiles/Brewfile --force --no-vscode` (then re-add the wezterm/zed/raycast casks if they were installed outside Homebrew).
