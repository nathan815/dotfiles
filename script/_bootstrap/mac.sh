#!/bin/bash

# Install Homebrew
if ! brew_loc="$(type -p "brew")" || [[ -z $brew_loc ]]; then
    echo "Installing Homebew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew upgrade

# ZSH Pure Prompt
# https://github.com/sindresorhus/pure
brew install pure

# Use latest version of Git instead of Apple Git
brew install git

# Java
brew install openjdk@11
echo "Linking openjdk for system wrapper"
sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# NodeJS
brew install node
brew install yarn

# Azure
brew install azure-cli

# Docker
brew install docker

# Ruby
brew install ruby@3.0.0
