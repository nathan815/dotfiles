#!/bin/bash

# Usage:
#  ./scripts/link.sh [-d|--dryrun] [-o|--override]

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

EXCLUDE='scripts/*|\.excl*|\.git$|\.gitignore$|\.gitmodules|.*.md|.DS_Store'

function link() {
  for file in $( ls -A | grep -vE "$EXCLUDE" ) ; do
    link_file="$HOME/$file"

    if test -d "$link_file" || test -f "$link_file"; then
      if [ -z "$OVERRIDE" ]; then
        echo "$link_file exists, skipping"
        continue
      fi
      echo -n "[overriding] "
    fi

    if [ -n "$DRYRUN" ]; then
      echo "[dryrun symlink] $HOME/$file -> $PWD/$file"
    else
      ln -svF "$PWD/$file" "$HOME"
    fi

  done
}

link
