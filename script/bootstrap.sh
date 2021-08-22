source ./link.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    source ./bootstrap/mac.sh
else
    # Linux
    source ./bootstrap/linux.sh
fi
