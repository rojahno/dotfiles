#!/bin/bash

# Tmux Plugin Installation Script
# This script installs all required tmux plugins

set -e

PLUGINS_DIR="$HOME/.tmux/plugins"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

install_plugin() {
    local repo="$1"
    local name=$(basename "$repo")
    local target="$PLUGINS_DIR/$name"
    
    if [ -d "$target" ]; then
        echo -e "${YELLOW}Already installed:${NC} $name"
    else
        echo -e "${GREEN}Installing:${NC} $name"
        git clone "https://github.com/$repo" "$target"
    fi
}

echo "Installing tmux plugins..."
echo ""

# Create plugins directory if it doesn't exist
mkdir -p "$PLUGINS_DIR"

# Install TPM (Tmux Plugin Manager)
install_plugin "tmux-plugins/tpm"

# Install plugins
install_plugin "tmux-plugins/tmux-sensible"
install_plugin "tmux-plugins/tmux-yank"
install_plugin "tmux-plugins/tmux-resurrect"
install_plugin "tmux-plugins/tmux-continuum"
install_plugin "fcsonline/tmux-thumbs"
install_plugin "sainnhe/tmux-fzf"
install_plugin "wfxr/tmux-fzf-url"
install_plugin "omerxx/catppuccin-tmux"
install_plugin "omerxx/tmux-sessionx"
install_plugin "omerxx/tmux-floax"

echo ""
echo -e "${GREEN}Tmux plugins installed successfully!${NC}"
echo "Reload tmux config with: tmux source ~/.config/tmux/tmux.conf"
