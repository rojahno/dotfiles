#!/bin/bash

set -e

DOTFILES_DIR="$HOME/Projects/dotfiles"

GREEN=$(tput setaf 2)
NC=$(tput sgr0)

which -s brew
if [[ $? != 0 ]]; then
  # Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add brew to path
  echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # Update homebrew recipes
  echo "Homebrew already installed"
  echo "Updating homebrew..."
  brew update
fi

# Run symlinks script first to ensure .Brewfile is in place
echo "Setting up symlinks..."
"$DOTFILES_DIR/scripts/symlinks.sh"

# Install everything from the brewfile
brew bundle --global

# Configure git
echo "Git config:"
echo "Set your global username for git:"
read -r gitUserName
git config --global user.name "$gitUserName"

echo "Set your global email for git:"
read -r gitEmail
git config --global user.email "$gitEmail"

# Setup SSH key
echo ""
echo "Do you want to setup SSH key for GitHub? (y/n)"
read -r setupSsh
if [ "$setupSsh" = "y" ]; then
    "$DOTFILES_DIR/scripts/ssh.sh" "$gitEmail"
fi

brew cleanup

# Create a folder for screenshots
mkdir -p ~/Screenshots

echo "Setting Mac settings..."
"$DOTFILES_DIR/macos/set-macos-defaults.sh"

echo "${GREEN}The setup is done!${NC}"
