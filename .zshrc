# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Path to your oh-my-zsh installation.
export ZSH="/home/prose/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
# Setting PATH for Python 3.6
export HISTCONTROL="ignoreboth"
# export LDFLAGS="-L/opt/homebrew/opt/libxml2/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libxml2/include"
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I$(brew --prefix openssl)/include"
export ZELLIJ_CONFIG_DIR="~/.config/zellij/"
ZSH_THEME="fino-time"
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh

function clean_git_branches {
  declare -a branches=(`git fetch -p`)
  branches+=(`git branch -vv | grep -Eow "\[origin\/([a-zA-Z0-9_-]+):\sgone\]" | sed -E "s/\[origin\///" | sed -E "s/: gone\]//"`)
  for i in "${branches[@]}"
  do
    git branch -D $i;
  done

}
fpath+=~/.zfunc
compinit
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias weather='curl wttr.in'
alias activate='source .env/bin/activate'
alias git_prune="git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"
alias git_delete_dead_branches="git branch -r --merged origin/main | grep -Ev 'main|develop|master' | cut -d / -f 2- | xargs -I branchname git push origin :branchname"
alias git_delete_dry_run="git branch -r --merged origin/main | grep -Ev 'main|develop|master' | cut -d / -f 2- | xargs"
alias ls="exa"
alias find="fd"
alias zj="zellij --layout /Users/prose/zellij-layouts/default.kdl --config ~/.config/zellij/config.kdl"
alias zv="zellij --layout /Users/prose/zellij-layouts/vertical.kdl --config ~/.config/zellij/config.kdl"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source ~/.config/envman/PATH.env
