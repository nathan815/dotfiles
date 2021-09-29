function get_input() {
  msg="$1"
  echo -n "$msg" > /dev/tty
  read input
  echo "$input"
}

function to_lower() {
  read stdin
  echo "$stdin" | awk '{print tolower($0)}'
}

function del() {
    mv "$1" ~/.Trash
    echo "Moved $1 to ~/.Trash"
}
