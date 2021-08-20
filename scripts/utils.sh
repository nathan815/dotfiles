function prompt() {
  msg="$1"
  echo -n "$msg" > /dev/tty
  read input
  echo "$input"
}

function tolower() {
  read stdin
  echo "$stdin" | awk '{print tolower($0)}'
}
