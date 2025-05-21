GREEN=$(tput setaf 2)

which -s brew
if [[ $? != 0 ]]; then
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

# Add git command to the terminal
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >>/Users/$USER/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

echo 'eval $(/opt/homebrew/bin/brew shellenv)' >>/Users/$USER/.zprofile

eval $(/opt/homebrew/bin/brew shellenv)

# Configurate the git-setup
echo "Git config:"
echo "Set your global username for git:"
read gitUserName
git config --global user.name $gitUserName

echo "Set your global email for git:"
read gitEmail
git config --global user.email $gitEmail

brew cleanup

# Create a folder for screenshots
mkdir ~/Screenshots

echo "Setting Mac settings..."
sh .macos

echo ${GREEN}"The setup file is done!"
