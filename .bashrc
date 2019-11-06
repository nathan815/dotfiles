export PATH="/usr/local/bin:$PATH"

# Prompt
export PS1="\w $ "

# Composer
export PATH="~/.composer/vendor/bin:$PATH"

# Improve ls
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

alias reload="source ~/.bash_profile"

alias art="php artisan"
alias phpunit="./vendor/bin/phpunit"
alias view-gitignore="git ls-files --ignored --exclude-standard"
alias apply-gitignore="git ls-files --ignored --exclude-standard | sed 's/.*/\"&\"/' | xargs git rm -r --cached"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/nathan/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;
