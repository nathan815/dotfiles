#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

source "$parent_path/link.sh"

echo "OS Type: $OSTYPE"

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running macOS bootstrap..."
    source "$parent_path/os_bootstrap/mac.sh"
else
    echo "Running Linux bootstrap..."
    source "$parent_path/os_bootstrap/linux.sh"
fi
