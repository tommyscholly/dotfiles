#!/bin/bash

pushd ~/ &>/dev/null || exit
home=$(pwd)
popd &>/dev/null || exit

stow --target="$home/.config" --restow */
