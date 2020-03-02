#source "${HOME}/.config/zsh/antigen/antigen.zsh"

###########################################################
#                      Plugin stuff
###########################################################
source "${HOME}/.zgen/zgen.zsh"
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


    # Send a notification when long running command exits
    zgen load marzocchi/zsh-notify


    # save all to init script
    zgen save
fi
##########################################################

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#Turn on vi mode
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/frans/.zshrc'

autoload -Uz compinit
compinit

#Fuzzy command line completion
local FZF_PATH="/usr/share/fzf/completion.zsh"
local FZF_BINDING_PATH="/usr/share/fzf/key-bindings.zsh"
if [ -f ${FZF_PATH} ]; then
    source ${FZF_PATH}
    source ${FZF_BINDING_PATH}

    #CD into a directory using fzf
    function cf()
    {

        #Run fzf on the result of find for all folders
        #dir=`find -type d | fzf --tiebreak=length,begin`
        #dir=`find -type d | fzf`
        dir=`bfs -type d | fzf`

		if [[ -n $dir ]]; then
        	cd $dir
		fi
    }
    #CD into a directory using fzf
    function ch()
    {

        #Run fzf on the result of find for all folders
        #dir=`find -type d | fzf --tiebreak=length,begin`
        #dir=`find -type d | fzf`
        dir=`cat ~/.file_index | fzf`

		if [[ -n $dir ]]; then
        	cd $dir
		fi
    }

	function vf()
	{
		file=`bfs . | fzf`

		nvim $file
	}
fi
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'



# Replacing commands with alternatives if they are installed
exa_not_installed=$(which exa 2>/dev/null | grep -v "not found" | wc -l)
if [ ${exa_not_installed} -eq 0 ]; then
     alias ls=/bin/ls --color=auto
else
    alias ls=exa
fi

##Completion stuff
####################################################################
zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'


zstyle ':completion:*:pacman:*' force-list always

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select

zstyle ':completion:*:*:killall:*' menu yes select

#- complete pacman-color the same as pacman
compdef _pacman pacman-color=pacman

#####################################################################

#Loading stuff
autoload -U promptinit
promptinit
autoload -U colors && colors

# Use surperior alternatives for commands if available


#Aliases
#alias ls='ls --color=auto'
alias fork='pwd | xfce4-terminal &'
alias r='~/.scripts/runAfterMake.sh'
alias :q=exit
alias q=exit
alias rg='rg --colors path:fg:green'
alias f='bfs | rg'
alias g=git
alias m=make
alias mp='make -j4'
alias l=ls
alias la="ls -la"
alias ll="ls -l"
alias v=vim
alias c=cd
alias ca=cargo
alias xa=xargo
alias p3=python3
alias p2=python2
alias ip3=ipython3
alias ip2=ipython2
alias ovim='/usr/bin/vim'
alias jpn='jupyter notebook'

#####################################################################
ZSH_THEME_GIT_PROMPT_CACHE=true
autoload -Uz colors && colors

#Colors for use in the prompt
#local NORMAL_COLOR
local PATH_COLOR='%F{5}'
local ARROW_COLOR='%F{1}'
local VI_I_COLOR='%F{2}'
local VI_N_COLOR='%F{1}'

#The look of the VI mode indicator
local VIM_PROMPT="%{${VI_N_COLOR}%}♦"
local VIM_INSERT_PROMPT="%{${VI_I_COLOR}%}♦"

local GIT_PROMPT='%b$(git_super_status)'

local BG_COLOR="%{$reset_color%}"
#If we are SSHd
if [ -z ${SSH_CLIENT+x} ]; then
	#If $SSH_CLIENT is unset
	BG_COLOR="%{$reset_color%}"
else
	BG_COLOR='%{$bg[cyan]%}'
fi


#Fuzzy tab completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'


#Show hostname in the right prompt
#RPS1="%{$fg[yellow]%}%m ${git_super_status}%{$reset_color%}%"
RPS1="${GIT_PROMPT}%{$fg[blue]%}%m%{$reset_color%}%"
function updateVim {
    #Styling the VI prompt
    VI_PROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/$VIM_INSERT_PROMPT}"

    #Contents of the lefth prompt
    PS1="${BG_COLOR}${PATH_COLOR}%5~ ${VI_PROMPT} ${ARROW_COLOR}➔ %{$reset_color%}%"

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
# Notification on long running exit

zstyle ':notify:*' error-title "Command failed (in #{time_elapsed} seconds)"
zstyle ':notify:*' success-title "Command finished (in #{time_elapsed} seconds)"


######################################################################
#History stuff
#Prevent duplicate history
setopt HIST_IGNORE_DUPS

# Save the time and how long a command ran
setopt EXTENDED_HISTORY


VIM_PATH='/usr/bin/nvim'

#Aliasing neovim if is installed
if [ -f ${VIM_PATH} ]; then
	alias vim='nvim'
fi


# not just at the end
setopt completeinword

export PATH=$PATH:~/bin/wallpaperManager:~/bin:~/.cargo/bin
export PATH=$PATH:~/.gem/ruby/2.3.0/bin
# Haskell and stack
export PATH=$PATH:~/.local/bin
#export PATH=$PATH:~/.config/bspwm


#Enable 256 bit colors over ssh
export TERM=xterm-256color
#export TERM=xterm

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
######################################################################
#                   RSA key stuff
######################################################################

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

#######################################################################
#                   Colored manpages
#######################################################################
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

#####################################################################
#                       NPM stuff
#####################################################################

PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

#####################################################################
#Keybindings
bindkey -sM vicmd '^[' '^G'
bindkey "^?" backward-delete-char
bindkey -sM vicmd ':' '^G'

#Ctrl+k is up
bindkey '^K' up-line-or-history
bindkey '^J' down-line-or-history

#Make home and end work
bindkey '\e[OH' beginning-of-line
bindkey '\e[OF' end-of-line

#Exit insert mode with jk
bindkey -M viins 'jk' vi-cmd-mode

#Use <C-r> to search for commands in history
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

export EDITOR=nvim

export BROWSER=firefox
export _JAVA_AWT_WM_NONREPARENTING=1
