#!/usr/bin/env bash

# Check if Homebrew is installed. If not, install it.
if ! [ -x "$(command -v brew)" ]; then
  echo "Homebrew is not installed. Installing it now..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed, proceeding..."
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install everything from Brewfile
brew bundle

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

# Add GNU coreutils to our path
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
