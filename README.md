# Dotfiles

## Project Structure Summary

**Installation Mechanism:**
- `./dev-env` - Copies files to `~` and `~/.config/`
- `./dotrun` - Runs platform-specific scripts from `./dotruns/`
- Files are copied, not symlinked

**Key Directories:**
- `env/` - Core configs (zshrc, vimrc, gitconfig, etc.)
- `env/config/` - XDG configs copied to `~/.config/`
- `dotruns/` - Installation scripts (brew_install_shared, defaults_mac, etc.)

## Usage

Override all dotfiles with:

```
DEV_ENV=. ./dev-env
```

Run scripts from dotruns depending on what workplace you're on with:

```
./dotrun shared
./dotrun mac
./dotrun linux
```
