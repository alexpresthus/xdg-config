export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export XDG_CONFIG_HOME="$HOME/.config"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH=$PATH
PATH+=":$HOME/.local/bin"
PATH+=":$HOME/bin"
PATH+=":$HOME/.yarn/bin"
PATH+=":$HOME/.config/yarn/global/node_modules/.bin"
PATH+=":/usr/local/bin"
PATH+=":/usr/local/go/bin"
PATH+=":/opt/nvim-linux64/bin"

export PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
