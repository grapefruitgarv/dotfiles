# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
  
# profiler to see what's happening
# zmodload zsh/zprof

# Added zi zpmod plugin  
  module_path+=( "/Users/archie/.zi/zmodules/zpmod/Src" )
  zmodload zi/zpmod

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell-mod"
# ZSH_THEME="emotty"
# ZSH_THEME="powerlevel10k/powerlevel10k"


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
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

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
plugins=(
# 	git
zsh-nvm
# asdf
# 	nvm
# 	# bower
# 	# colored-man-pages
# 	brew
# 	macos
# 	extract
# 	asdf
# 	z
# 	# command-not-found
#  safe-paste 
# aliases 
# zsh-syntax-highlighting
zsh-completions
you-should-use
fzf-zsh-plugin
fd-zsh
fzf-dir-navigator
)

# zplug manager stuff
source /opt/homebrew/Cellar/zplug/2.4.2/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "changyuheng/fz", defer:1
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# homebrew completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source <(curl -sL init.zshell.dev); zzinit
# zi to load plugins
zi snippet OMZP::git
zi snippet OMZP::nvm
zi snippet OMZP::brew
# zi snippet OMZP::macos
zi snippet OMZP::extract
zi snippet OMZP::asdf
zi snippet OMZP::z
zi snippet OMZP::safe-paste
zi snippet OMZP::aliases
# zi snippet OMZP::zoxide
zi snippet OMZP::dirhistory
zi snippet OMZP::command-not-found
zi snippet OMZP::pyenv
zi snippet OMZP::zsh-interactive-cd

source ~/.zi/plugins/tj---git-extras/etc/git-extras-completion.zsh

# 1Password completion
eval "$(op completion zsh)"; compdef _op op

source ~/.fonts/*.sh

source $ZSH/oh-my-zsh.sh

# User configuration

# setopt HIST_IGNORE_ALL_DUPS

# load asdf completions
. /opt/homebrew/Cellar/asdf/0.13.1/etc/bash_completion.d/asdf.sh

# remember directories
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# how to display directories
zstyle ':completion:*:*:cdr:*:*' menu selection

# include Z, the fuzzy search
. /opt/homebrew/etc/profile.d/z.sh
# zstyle ':completion:*' menu select
autoload -U compinit && compinit


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby 3.3.3
# Frum ruby manager
#eval "$(frum init)"

# My aliases

alias src="source $HOME/.zshrc"
alias zsconfig="code ~/.zshrc"
alias home='cd ~'
alias ls='exa --icons -stype'
alias lsh='exa --icons --long --header -stype'
alias lc='colorls --sd'
alias lr='\ls -hartl'
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
alias lsg='ls --group-directories-first' # group directories first for ls/exa
alias dl='cd ~/Downloads'
# Avoid accidental deletions
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias tre='tree -CL 2'

# Prevent rm -f from asking for confirmation on things like `rm -f *.bak`.
setopt rm_star_silent

# For lesspipe
export LESSOPEN="|/opt/homebrew/bin/lesspipe.sh %s"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Zi installer added these
zi light-mode for \
  z-shell/z-a-meta-plugins \
  @annexes # <- https://wiki.zshell.dev/ecosystem/category/-annexes
# examples here -> https://wiki.zshell.dev/community/gallery/collection
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands
zi light-mode for \
  z-shell/z-a-meta-plugins \
  @annexes @zunit

zi has'zoxide' wait lucid for \
  z-shell/zsh-zoxide

source $(dirname $(gem which colorls))/tab_complete.sh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light zdharma-continuum/fast-syntax-highlighting
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
