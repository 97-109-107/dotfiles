#!/bin/bash
find ~/.dotfiles/ -maxdepth 1 -name '.*' ! -iname ".*.sw*" ! -path ~/.dotfiles/ ! -path ~/.dotfiles/.git ! -path ~/.dotfiles/dotfiles_install -printf "%f:%p\n" | while IFS=":" read FNAME FPATH
do
  ln -svf "$FPATH" $HOME/$FNAME
done
