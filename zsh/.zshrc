# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# For brew
export PATH=/usr/local/bin:$PATH
# export KUBECONFIG=./.kubeconfig || ~/.config/.kubeconfig
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$(brew --prefix)/bin:$PATH 

# THEME
ZSH_THEME=robbyrussell
source /Users/andreassunde/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(direnv hook zsh)"

# PLUGINS
plugins=(
  kubectl
  Kubectx
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

# Oh-my-zsh autocomplete history cache
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

#KUBECTL AUTOCOMPLETE
autoload -U +X compinit && compinit
source <(kubectl completion zsh)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# ALIAS

# Flow
# alias bs='blocc config set; make auth;'
# Kubernetes
alias ktx="kubectx"
alias kn="kubens"
alias k="kubectl"
alias kpf='kubectl port-forward'

# Git
alias gdlb='git branch | grep -v "main\|master" | xargs git branch -D'
alias gpmpr='gitPrefix=$(git remote get-url origin | sed -E "s/(git@github.com|\.git|https:\/\/github.com)//g"); git push && open "https://github.com/$gitPrefix/compare/$(git branch --show-current)?expand=1"'
alias gc='git checkout'
alias gparent="git show-branch | grep '*' | grep -v \"$(git rev-parse --abbrev-ref HEAD)\" | head -n1 | sed 's/.*\\[\\(.*\\)\\].*/\\1/' | sed 's/[\\^~].*//' #"

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
# export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"
export PATH="/opt/homebrew/opt/dotnet@8/bin:$PATH"

eval "$(starship init zsh)"

fn cnvim () {
  cd ~/Programming/$* && nvim .
}
fn cfg () {
  cd ~/.config/$* && nvim .
}

# pnpm
export PNPM_HOME="/Users/andreassunde/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Created by `pipx` on 2025-03-08 16:23:24
export PATH="$PATH:/Users/andreassunde/.local/bin"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
