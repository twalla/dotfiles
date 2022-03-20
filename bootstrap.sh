#!/usr/bin/env zsh

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
brew bundle install

# Cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

# Add GNU coreutils to our path
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# Call .macos bootstrap script
if [ "$(uname -s)" == Darwin ]; then
  source .macos
fi
