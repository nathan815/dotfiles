#!/bin/bash

while test $# -gt 0
do
    case "$1" in
        --dryrun|-d) DRYRUN=1 ;;
        --override|-o) OVERRIDE=1 ;;
        *) 
          echo "unknown argument $1"
          exit 1
        ;;
    esac
    shift
done

function link() {
  for file in $( ls -A | grep -vE 'scripts/*|\.excl*|\.git$|\.gitignore$|\.gitmodules|.*.md' ) ; do
    link_file="$HOME/$file"

    if ! test -d "$link_file" || ! test -f "$link_file"; then
      if [ -z "$OVERRIDE" ]; then
        echo "$link_file exists, skipping"
        continue
      fi
      echo "Overriding $link_file"
    fi

    if [ -n "$DRYRUN" ]; then
      echo "[dryrun] symlink $HOME/$file -> $PWD/$file"
    else
      #echo "ln -svF $PWD/$file $HOME"
      ln -svF "$PWD/$file" "$HOME"
    fi

  done
}

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

link
