# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

#store timestamp
HISTTIMEFORMAT='%F %T '
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\\$\[$(tput setaf 7)\]\u\[$(tput setaf 1)\] \W\[$(tput setaf 2)\]: \[$(tput sgr0)\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # alias android-connect="mtpfs -o allow_other /media/LGVu"
    # alias android-disconnect="fusermount -u /media/LGVu"
    # alias ls='ls --color=auto'
    # alias dir='dir --color=auto'
    # alias vdir='vdir --color=auto'
    # alias lsblk='lsblk -o NAME,LABEL,MOUNTPOINT,SIZE,UUID'
    # alias ll="ls -lAGh --group-directories-first --time-style=+%d/%m' '%H:%M"
    # alias r='ranger'
    # alias cal='ncal -MC3'
    # alias t='tail -f'
    # alias ack='ack-grep -i'
    # alias vi='vim'
    # alias grep='grep --color=auto'
    # alias fgrep='fgrep --color=auto'
    # alias egrep='egrep --color=auto'
    # alias cd..='cd ..'
    # alias ..='cd ..'
    # alias ...='cd ../../../'
    # alias ....='cd ../../../../'
    # alias .....='cd ../../../../'
    # alias .4='cd ../../../../'
    # alias .5='cd ../../../../..'
    # alias h='history'
    # alias svi='sudo vi'
    # alias edit='vim'
    # alias cmus='cd ~/Downloads/; cmus'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
 
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
	startx
	# xinit
fi 
 shopt -q -s cdspell
#  # Make sure display get updated when terminal window get resized
shopt -q -s checkwinsize
#   # Turn on the extended pattern matching features 
shopt -q -s extglob
#    # Append rather than overwrite history on exit
shopt -s histappend
# Make multi-line commandsline in history
shopt -q -s cmdhist 
# Get immediate notification of background job termination
set -o notify 
# Disable [CTRL-D] which is used to exit the shell
set -o ignoreeof
export HISTFILESIZE=10000      

# set vi keybindings
set -o vi
# adding z.sh
. /usr/local/bin/z.sh
export PATH="$PATH:/var/lib/gems/1.8/bin:."
# export and update history after each commad

COLORFGBG="default;default"

# reverse search an insensitive
# "\e[A" history-search-backward
# "\e[B" history-search-forward
# set show-all-if-ambiguous on
# set completion-ignore-case on

# mutt background fix
COLORFGBG="default;default"
