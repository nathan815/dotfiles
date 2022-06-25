#!/usr/bin/env bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

source "$parent_path/link.sh"

echo "OS Type: $OSTYPE"

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running macOS bootstrap..."
    source "$parent_path/bootstrap/mac.sh"
else
    echo "Running Linux bootstrap..."
    source "$parent_path/bootstrap/linux.sh"
fi

NVM_VERSION="v0.38.0"
echo "Installing nvm $NVM_VERSION"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | PROFILE=/dev/null bash
