# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
tmux
lighthouse
z
colorize
sudo
cp
extract
web-search
battery
git
git-extras
git-flow
github
gitfast
gitignore
svn
python
ruby
go
golang
docker
zsh-completions
zsh-syntax-highlighting
git-flow-completion
osx
kubectl
exercism-completion
rust
cargo
zsh-autosuggestions
)

if [[ -w $ZSH ]]; then
plugins+=zsh_reload
[[ ! -d "$ZSH/cache" ]] && /bin/mkdir "$ZSH/cache"
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

[[ -e ~/.http_proxy.sh ]] && source ~/.http_proxy.sh
[[ -e ~/.antigen/antigen.zsh ]] && source ~/.antigen/antigen.zsh
[[ -e ~/.customrc ]] && source ~/.customrc

antigen use oh-my-zsh
antigen bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

antigen apply

autoload -U promptinit
