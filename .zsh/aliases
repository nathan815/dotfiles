alias art="php artisan"

alias phpunit="./vendor/bin/phpunit"

alias git-view-ignored="git ls-files --ignored --exclude-standard"

alias git-apply-ignore="git ls-files --ignored --exclude-standard | sed 's/.*/\"&\"/' | xargs git rm -r --cached"

alias git-prune-branches="git branch --merged | egrep -v '(^\*|master|main|dev)' | xargs git branch -d" # deletes merged local branches

# Improve ls
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
