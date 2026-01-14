# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
. $HOMEBREW_PREFIX/etc/profile.d/z.sh
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# vi-mode disabled - was causing right Option key issues

source $ZSH/oh-my-zsh.sh

# Carapace completions with styling
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)

# Catppuccin Mocha colors for completions
local mauve=$'\e[38;2;203;166;247m'      # #cba6f7
local blue=$'\e[38;2;137;180;250m'       # #89b4fa
local sky=$'\e[38;2;137;220;235m'        # #89dceb
local teal=$'\e[38;2;148;226;213m'       # #94e2d5
local green=$'\e[38;2;166;227;161m'      # #a6e3a1
local yellow=$'\e[38;2;249;226;175m'     # #f9e2af
local peach=$'\e[38;2;250;179;135m'      # #fab387
local red=$'\e[38;2;243;139;168m'        # #f38ba8
local pink=$'\e[38;2;245;194;231m'       # #f5c2e7
local lavender=$'\e[38;2;180;190;254m'   # #b4befe
local text=$'\e[38;2;205;214;244m'       # #cdd6f4
local subtext=$'\e[38;2;166;173;200m'    # #a6adc8
local surface=$'\e[48;2;49;50;68m'       # #313244 (background)
local reset=$'\e[0m'

# Completion styling - Catppuccin themed
zstyle ':completion:*' menu select                                       # Interactive menu selection
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'                   # Case insensitive matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"                  # Colorize files
zstyle ':completion:*' group-name ''                                     # Group completions by type
zstyle ':completion:*' format "${mauve}── %d ──${reset}"                 # Mauve headers
zstyle ':completion:*:descriptions' format "${blue}%d${reset}"           # Blue descriptions
zstyle ':completion:*:corrections' format "${yellow}%d (errors: %e)${reset}"  # Yellow corrections
zstyle ':completion:*:warnings' format "${red}── No matches found ──${reset}" # Red warnings
zstyle ':completion:*:messages' format "${teal}%d${reset}"               # Teal messages
zstyle ':completion:*:default' list-prompt "${subtext}%S%M matches%s${reset}"
zstyle ':completion:*' select-prompt "${lavender}%SScrolling: %p%s${reset}"
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

# Catppuccin colors for specific completion types
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=${peach}=${red}"
zstyle ':completion:*:*:*:*:hosts' list-colors "=${sky}"
zstyle ':completion:*:*:*:*:users' list-colors "=${pink}"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fn cnvim () {
  cd ~/Programming/$* && nvim .
}
fn cfg () {
  cd ~/.config/$* && nvim .
}
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATHS
export PATH="$PATH:/usr/local/bin/node"

export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion# ALIAS

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
alias gparent='git show-branch | grep "*" | grep -v "$(git rev-parse --abbrev-ref HEAD 2>/dev/null)" | head -n1 | sed "s/.*\\[\\(.*\\)\\].*/\\1/" | sed "s/[\\^~].*//" #'

# Vim
alias vim="nvim"
alias vi="nvim"


# Java
alias j21='export JAVA_HOME=/opt/homebrew/opt/openjdk@21 && export PATH=$JAVA_HOME/bin:$PATH && hash -r'
alias jv="java --version"


export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Initialize zoxide (smart cd)
eval "$(zoxide init zsh)"

# Set terminal tab title to current folder name
precmd() {
  print -Pn "\e]0;%1~\a"
}

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/andreas/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
