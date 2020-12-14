#!/bin/bash

# set -x

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'

NC='\033[0m' # No Color

printf "${PURPLE}Setting up .bashrc:${NC}\n"

BASHRC_FULL_PATH="$HOME/.bashrc" 

if [[ -f $BASHRC_FULL_PATH ]]; then
  NEW_BASHRC_FILENAME=".bashrc-$( date +"%F-%H%M-%s" ).bak"

  printf "${YELLOW}Moving existing .bashrc to ${NEW_BASHRC_FILENAME}${NC}\n"
  mv $BASHRC_FULL_PATH $HOME/$NEW_BASHRC_FILENAME
fi

cat > $BASHRC_FULL_PATH <<NEW_BASHRC
# Adjust as needed:

JDUNK_SUPER_BASHRC="${DOTFILES_DIR}/.bashrc"

NEW_BASHRC

cat $DOTFILES_DIR/.bashrc.template >> $BASHRC_FULL_PATH

chmod 600 $BASHRC_FULL_PATH

printf "${CYAN}New .bashrc installed${NC}\n"

printf "${PURPLE}Setting up GNU Screen:${NC}\n"
SCREENRC_FULL_PATH="${HOME}/.screenrc"
if [[ -e $SCREENRC_FULL_PATH ]]; then
  echo "skipping .screenrc (already exists)"
else
  ln -s $DOTFILES_DIR/.screenrc $HOME
  printf "${CYAN}.screenrc linked${NC}\n"
fi

printf "${PURPLE}Setting up VIM:${NC}\n"

VIMDIR_FULL_PATH="${HOME}/.vim"

if [[ -e $VIMDIR_FULL_PATH ]]; then
  echo "skipping .vim (already exists)"
else
  ln -s $DOTFILES_DIR/.vim $HOME
  printf "${CYAN}.vim linked${NC}\n"

  # .vimrc is dependent upon .vim
  VIMRC_FULL_PATH="${HOME}/.vimrc"
  if [[ -e $VIMRC_FULL_PATH ]]; then
    echo "skipping .vimrc (already exists)"
  else
    ln -s $DOTFILES_DIR/.vimrc $HOME
    printf "${CYAN}.vimrc linked${NC}\n"
  fi
fi

printf "${PURPLE}Setting up git config:${NC}\n"

GITCONFIG_FULL_PATH="${HOME}/.gitconfig"
if [[ -e $GITCONFIG_FULL_PATH ]]; then
  echo "skipping .gitconfig (already exists)"
else
  ln -s $DOTFILES_DIR/.gitconfig $HOME
  printf "${CYAN}.gitconfig linked${NC}\n"
fi

GITIGNORE_GLOBAL_FULL_PATH="${HOME}/.gitignore_global"
if [[ -e $GITIGNORE_GLOBAL_FULL_PATH ]]; then
  echo "skipping .gitignore_global (already exists)"
else
  ln -s $DOTFILES_DIR/.gitignore_global $HOME
  printf "${CYAN}.gitignore_global linked${NC}\n"
fi
