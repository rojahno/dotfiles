GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NC=$'\e[0m'

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    # Update homebrew recipes
    echo "Allready installed"
    echo "Updating homebrew..."
    brew update
fi

# Install everything from the brewfile
brew bundle

# Configurate the git-setup
echo "Git config:"
echo "Set your global username for git:"
# read gitUserName
# git config --global user.name $gitUserName
git config --global user.name "Rojahno"

echo "Set your global email for git:"
# read gitEmail
# git config --global user.email $gitEmail
git config --global user.email "andreas_sunde97@hotmail.com"

brew cleanup

echo "Setting Mac settings..."

#"Disabling system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

#"Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#"Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

#"Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

#"Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#"Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

#"Disable annoying backswipe in Chrome"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool 
false

#"Setting screenshot format to PNG"
defaults write com.apple.screencapture type -string "png"

echo "{RED}The setup file is done!"
