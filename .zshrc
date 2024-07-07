
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# For brew, at least
export PATH=/usr/local/bin:$PATH
export KUBECONFIG=./.kubeconfig || ~/.config/.kubeconfig
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"


# NVM Stuff
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$(brew --prefix)/bin:$PATH 

# THEME
ZSH_THEME="robbyrussell"
eval "$(starship init zsh)"
source /Users/andreassunde/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(direnv hook zsh)"

# PLUGINS
plugins=(
  kubectl
  Kubectx
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

#KUBECTL AUTOCOMPLETE
autoload -U +X compinit && compinit
source <(kubectl completion zsh)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# ALIAS

# Kubernetes
alias nr="npm run"
alias ktx="kubectx"
alias kns="kubens"
alias k="kubectl"
alias kpf='kubectl port-forward'

# Git
alias gdlb='git branch | grep -v "main\|master" | xargs git branch -D'
alias gpmpr='git push && gitPrefix=$(git remote get-url origin | sed -E "s/(git@github.com:|.git)//g") && open "https://github.com/$gitPrefix/compare/$(git branch --show-current)?expand=1"'

# Vim
alias vim="nvim"
alias vi="nvim"

# Path
alias cnn="code ~/Programming/nordea/nordea-finance-no"
alias cns="code ~/Programming/nordea/nordea-finance-se"
alias cnc="code ~/Programming/nordea/nordea-finance-common"

# Java
alias j21='export JAVA_HOME=/opt/homebrew/opt/openjdk && export PATH=$JAVA_HOME/bin:$PATH && export MAVEN_OPTS="-Dmaven.compiler.source=21 -Dmaven.compiler.target=21"'
alias j17='export JAVA_HOME=/opt/homebrew/opt/openjdk@17 && export PATH=$JAVA_HOME/bin:$PATH && export MAVEN_OPTS="-Dmaven.compiler.source=17 -Dmaven.compiler.target=17"'
alias j11='export JAVA_HOME=/opt/homebrew/opt/openjdk@11 && export PATH=$JAVA_HOME/bin:$PATH && export MAVEN_OPTS="-Dmaven.compiler.source=17 -Dmaven.compiler.target=17"'
alias jv="java --version"

export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"
export PATH="/opt/homebrew/opt/dotnet@8/bin:$PATH"
