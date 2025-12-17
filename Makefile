.PHONY: all setup symlinks ssh brew macos help

DOTFILES_DIR := $(HOME)/Projects/dotfiles

# Default target - show help
help:
	@echo "Dotfiles Management"
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  all       - Run full setup (setup + symlinks + brew + macos)"
	@echo "  setup     - Run the main setup script (interactive)"
	@echo "  symlinks  - Create all symlinks"
	@echo "  ssh       - Generate SSH key for GitHub"
	@echo "  brew      - Install/update Homebrew packages"
	@echo "  macos     - Apply macOS defaults"
	@echo "  help      - Show this help message"

# Full setup
all: symlinks brew macos
	@echo "Full setup complete!"

# Run the main setup script (interactive - includes git config)
setup:
	@bash $(DOTFILES_DIR)/scripts/setup.sh

# Create symlinks only
symlinks:
	@bash $(DOTFILES_DIR)/scripts/symlinks.sh

# Generate SSH key
ssh:
	@bash $(DOTFILES_DIR)/scripts/ssh.sh

# Install/update brew packages
brew: symlinks
	@echo "Installing Homebrew packages..."
	@brew bundle --global
	@brew cleanup

# Apply macOS settings
macos:
	@bash $(DOTFILES_DIR)/macos/set-macos-defaults.sh
