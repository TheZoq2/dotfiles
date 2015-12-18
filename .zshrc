source "${HOME}/.config/zsh/zgenInit"

PATH_COLOR="%F{126}"
ARROW_COLOR="%F{196}"
VI_I_COLOR="%F{28}"
VI_N_COLOR="%F{124}"

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
# End of lines added by compinstall

#Loading stuff
autoload -U promptinit
promptinit
autoload -U colors && colors

#Aliases
#alias ls='ls --color=auto'
alias fork='pwd | xfce4-terminal &'
alias r='~/.scripts/runAfterMake.sh'

#Keybindings
bindkey -sM vicmd '^[' '^G'
bindkey "^?" backward-delete-char
bindkey -sM vicmd ':' '^G'

#Colors
#PROMPT="%{$fg[250]%}%n %B%{$fg[red]%}%5~ %{$fg[red]%}$ %b%{$reset_color%}%"
#PROMPT="%B%{$fg[38;5;126]%}%5~ %{$fg[red]%}$ %b%{$reset_color%}%"
RPROMPT="${KEYMAP/vicmd/I} %m test"
#PROMPT="%{\e[38;5;51m%} Yolo"
PS1=$'${PATH_COLOR}%5~ %{\e[0m%}${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/$VIM_INSERT_PROMPT} ${ARROW_COLOR}➔ '

#Showing vi mode in right prompt
function zle-line-init zle-keymap-select {
    ADDITIONAL_RPROMPT="%{$fg[yellow]%}%m%{$reset_color%} "

    VIM_PROMPT="${VI_N_COLOR}♦"
    VIM_INSERT_PROMPT="${VI_I_COLOR}♦"

    RPS1="$ADDITIONAL_RPROMPT"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

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
alias ls='ls --color=auto'

#Use <C-r> to search for commands in history
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

