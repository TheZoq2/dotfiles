#source "${HOME}/.config/zsh/antigen/antigen.zsh"

###########################################################
#                      Plugin stuff
###########################################################
source "${HOME}/.config/zsh/zgenInit"
# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # plugins
    #zgen load chrissicool/zsh-256color

    # completions
    #zgen load zsh-users/zsh-completions src

    #Command suggestions
    #zgen load hchbaw/auto-fu.zsh

    #Syntax highlighting
    zgen load zsh-users/zsh-syntax-highlighting

    #Git prompt stuff
    zgen load olivierverdier/zsh-git-prompt

    # save all to init script
    zgen save
fi
###########################################################
    
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/frans/.zshrc'

autoload -Uz compinit
compinit

#Fuzzy command line completion
local FZF_PATH="/etc/profile.d/fzf.zsh"
if [ -f ${FZF_PATH} ]; then
    source ${FZF_PATH}
fi

##Completion stuff
####################################################################
zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'


zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#- complete pacman-color the same as pacman
compdef _pacman pacman-color=pacman

#####################################################################

#Loading stuff
autoload -U promptinit
promptinit
autoload -U colors && colors

#Aliases
#alias ls='ls --color=auto'
alias fork='pwd | xfce4-terminal &'
alias r='~/.scripts/runAfterMake.sh'
alias :q=exit

#Keybindings
bindkey -sM vicmd '^[' '^G'
bindkey "^?" backward-delete-char
bindkey -sM vicmd ':' '^G'

#####################################################################
ZSH_THEME_GIT_PROMPT_CACHE=true
#Colors for use in the prompt
#local NORMAL_COLOR
local PATH_COLOR='%F{5}'
local ARROW_COLOR='%F{1}'
local VI_I_COLOR='%F{2}'
local VI_N_COLOR='%F{1}'

#The look of the VI mode indicator
local VIM_PROMPT="${VI_N_COLOR}♦"
local VIM_INSERT_PROMPT="${VI_I_COLOR}♦"

local GIT_PROMPT='%b$(git_super_status)'

#Show hostname in the right prompt
#RPS1="%{$fg[yellow]%}%m ${git_super_status}%{$reset_color%}%"
RPS1="${GIT_PROMPT}%{$fg[blue]%}%m%{$reset_color%}%"
function updateVim {
    #Styling the VI prompt
    VI_PROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/$VIM_INSERT_PROMPT}"

    #Contents of the lefth prompt
    PS1="${PATH_COLOR}%5~ ${VI_PROMPT} ${ARROW_COLOR}➔ %{$reset_color%}%"

    zle reset-prompt
}
#Function that runs every time the vi mode is changed and when a new line is started
function zle-line-init zle-keymap-select 
{
    #Run autosuggestions
    updateVim
}
function zle-keymap-select 
{
    updateVim
}


zle -N zle-line-init
zle -N zle-keymap-select
#####################################################################

# Accept suggestions without leaving insert mode
bindkey '^F' vi-forward-word

#Removing vi lag
export KEYTIMEOUT=1

export MAKEFLAGS="j5"


######################################################################
#History stuff
#Prevent duplicate history
setopt HIST_IGNORE_DUPS

#Don't add commands starting with space to history
setopt HIST_IGNORE_SPACE

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

#Alias some commands to make them not show up in history
alias cd=' cd'
alias sl=' ls --color=auto'
alias ls=' ls --color=auto'

alias ovim='/usr/bin/vim'
alias vim='nvim'

#Use <C-r> to search for commands in history
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# not just at the end
setopt completeinword

export PATH=$PATH:~/bin/wallpaperManager


alias posr='pintos --qemu -v -- run'
export PATH=$PATH:~/Documents/cpp/tddb68-labs/pintos/utils

