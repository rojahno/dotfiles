#!/bin/bash

# Symlink script for dotfiles
# This script creates symbolic links from dotfiles repo to their proper locations

set -e

DOTFILES_DIR="$HOME/Projects/dotfiles"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

create_symlink() {
    local source="$1"
    local target="$2"
    
    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Remove existing file/symlink if it exists
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo -e "${YELLOW}Removing existing:${NC} $target"
        rm -rf "$target"
    fi
    
    ln -sf "$source" "$target"
    echo -e "${GREEN}Created symlink:${NC} $target -> $source"
}

echo "Setting up dotfiles symlinks..."
echo ""

# Zsh
create_symlink "$DOTFILES_DIR/zshrc/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/zshrc/.p10k.zsh" "$HOME/.p10k.zsh"

# Neovim
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Aerospace (window manager)
create_symlink "$DOTFILES_DIR/aerospace/.aerospace.toml" "$HOME/.aerospace.toml"

# Yabai (window manager)
# create_symlink "$DOTFILES_DIR/yabai/yabairc" "$HOME/.config/yabai/yabairc"

# skhd (hotkey daemon)
# create_symlink "$DOTFILES_DIR/skhd/skhdrc" "$HOME/.config/skhd/skhdrc"

# JetBrains IDEs (IntelliJ, Rider, etc.)
create_symlink "$DOTFILES_DIR/jetbrains/.ideavimrc" "$HOME/.ideavimrc"

# Homebrew
create_symlink "$DOTFILES_DIR/brew/.Brewfile" "$HOME/.Brewfile"

# SSH
create_symlink "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"

# Tmux (XDG compliant location)
create_symlink "$DOTFILES_DIR/tmux" "$HOME/.config/tmux"

# Ghostty terminal
create_symlink "$DOTFILES_DIR/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# VS Code
create_symlink "$DOTFILES_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

# Caps Lock to Escape LaunchAgent (for Vim)
create_symlink "$DOTFILES_DIR/macos/com.local.CapsLockToEscape.plist" "$HOME/Library/LaunchAgents/com.local.CapsLockToEscape.plist"

echo ""
echo -e "${GREEN}Dotfiles symlinks created successfully!${NC}"
