#!/bin/bash

# SSH Setup Script
# Generates a new SSH key and configures the ssh-agent

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES_DIR="$HOME/Projects/dotfiles"

echo "Generating a new SSH key for GitHub..."

# Check if email is provided as argument
if [ -z "$1" ]; then
    echo -e "${YELLOW}Please provide your email address:${NC}"
    read -r email
else
    email="$1"
fi

# Check if SSH key already exists
if [ -f ~/.ssh/id_ed25519 ]; then
    echo -e "${YELLOW}SSH key already exists at ~/.ssh/id_ed25519${NC}"
    echo "Do you want to overwrite it? (y/n)"
    read -r overwrite
    if [ "$overwrite" != "y" ]; then
        echo "Skipping SSH key generation"
        exit 0
    fi
fi

# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Generating a new SSH key
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519

# Symlink the SSH config
if [ -f "$DOTFILES_DIR/ssh/config" ]; then
    cp "$DOTFILES_DIR/ssh/config" ~/.ssh/config
    chmod 600 ~/.ssh/config
    echo -e "${GREEN}SSH config copied${NC}"
fi

# Adding your SSH key to the ssh-agent
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
eval "$(ssh-agent -s)"

ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Copy public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub

echo ""
echo -e "${GREEN}SSH key generated successfully!${NC}"
echo -e "${GREEN}Your public key has been copied to clipboard.${NC}"
echo ""
echo "Next steps:"
echo "1. Go to https://github.com/settings/keys"
echo "2. Click 'New SSH key'"
echo "3. Paste your key (already in clipboard)"
