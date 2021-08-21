function load_config() {
	file="$1"
	if [ -f $file ]; then
        source $file
	else
        me=`basename "$0"`
        print "[~/.profile] config file not found: $file"
	fi
}

load_config ~/.dotfiles_base/aliases.sh
load_config ~/.dotfiles_base/functions.sh

# Android
export PATH="$PATH:/usr/local/bin:~/Library/Android/sdk:~/Library/Android/sdk/platform-tools"

# Composer (PHP)
export PATH="$PATH:~/.composer/vendor/bin"

# RVM (Ruby)
export PATH="$PATH:$HOME/.rvm/bin"

# Node Version Manager
# export NVM_DIR=~/.nvm
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" #--no-use
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=$HOME/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;
