#!/bin/bash

pushd ~/ &>/dev/null || exit
home=$(pwd)
popd &>/dev/null || exit

shopt -s extglob || exit
stow --target="$home/.config" --restow !(zsh|init.sh|.git)/

pushd zsh &>/dev/null || exit
stow --target="$home" --restow config
stow --target="$home/.oh-my-zsh/themes" --restow theme

