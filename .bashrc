# ======= SETUP INSTRUCTIONS ==============
# Include this file by putting the following in your ~/.bashrc:
#
# SUPER_BASHRC="$HOME/dotfiles/.bashrc"
# [ -f $SUPER_BASHRC ] && . $SUPER_BASHRC
#
# Optionally, to disable showing the git branch name in the PS1, add the following BEFORE you source this file:
#
# export GIT_PS1_DISABLED=true;
#
# And use the following to configure gnu screen autostart:
#
# export GNU_SCREEN_DISABLE_AUTOSTART=true;
# export GNU_SCREEN_WORKING_DIR=/whatever/default/dir/you/want;
#
# =========================================

# ========================================================================
# Disable output from `cd` and others, e.g. 'Saving session...completed.'
# ========================================================================
SHELL_SESSION_FILE=

# ================================================
# Get directory/path of this script
# ================================================

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
# ================================================

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export TERM="xterm-256color"
# at the least, LC_COLLATE affects "ls" sort order case-sensitivity
export LC_COLLATE=C

export EDITOR="/usr/bin/vim"
export MAILDIR="~/Maildir"
export PHANTOMJS_BIN=`which phantomjs`
export SITES="/etc/nginx/sites-available"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

shopt -s expand_aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f "$DIR/.bash_aliases" ]; then
    . "$DIR/.bash_aliases"
fi

color()(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[31m&\e[m,'>&2)3>&1

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend 2>/dev/null

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize 2>/dev/null

# turns any <dirname> by itself into `cd <dirname>`
shopt -s autocd 2>/dev/null

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
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
    if [ "$GIT_PS1_DISABLED" != true ]; then
        CURR_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
        source $CURR_DIR/.git-prompt.sh

        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(gbnf)\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
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

# enable bash completion features
# (NOTE: this is unnecessary if file(s) already sourced via
# /etc/profile -> /etc/bash.bashrc -> /etc/bash_completion*)

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#if [ -d $BASH_COMPLETION_DIR ]; then
#    for file in $BASH_COMPLETION_DIR/* ; do
#        source "$file"
#    done
#fi

if [ -d ~/bash_completion.d ]; then
    for file in ~/bash_completion.d/* ; do
        source "$file"
    done
fi

if [ "$GNU_SCREEN_DISABLE_AUTOSTART" != true ] && [ ! $WINDOW ]; then

    # if screen working directory set, cd to it
    if [[ $GNU_SCREEN_WORKING_DIR ]]; then
        cd $GNU_SCREEN_WORKING_DIR
    else
        cd /var/www
    fi

    SCREENLIST=`screen -ls | grep 'Attached'`
    if [ $? -eq "0" ]; then
        echo -e "Screen is already running and attached:\n ${SCREENLIST}"
    else
        screen -U -R
    fi
fi
