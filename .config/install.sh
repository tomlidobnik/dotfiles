#!/bin/bash

# Request sudo password at the start (only once)
echo "Requesting sudo privileges..."
sudo -v

# Check if Homebrew is installed and install it if not
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# macOS settings
echo "Configuring macOS system settings..."
defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock show-recents -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSGrammarCheckingEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write com.apple.dock autohide-time-modifier -float 0.15;
defaults delete com.apple.dock autohide-delay;
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15
killall Dock


# Instructions for additional apps
echo "Go to System Settings > Keyboard > Text Input and disable all"
# Install packages with Homebrew
brew bundle

cd "~/dotfiles/"
stow .

# Ensure Fish shell is available in /etc/shells and set it as the default
grep -qxF "/opt/homebrew/bin/fish" /etc/shells || echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
