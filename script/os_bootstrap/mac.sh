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

# Utilities
brew install yarn # Yarn (npm alternative)
brew install azure-cli
brew install gh
brew install jq

# Ruby
brew install ruby@3

# Java
brew install openjdk@11
jdk_system_wrapper="/Library/Java/JavaVirtualMachines/openjdk-11.jdk"
if [ ! -L "$jdk_system_wrapper" ]; then
    echo "Linking openjdk for system wrapper (requires root)"
    sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk "$jdk_system_wrapper"
fi

# Docker Desktop
brew install --cask docker