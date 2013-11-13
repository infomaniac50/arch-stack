#!/bin/bash

function enable_bin()
{
    chmod u+x ${HOME}/bin/*
}

PATH=$PATH:~/bin

enable_bin

pacman -Syu --noconfirm && \
pacman -S git-core --noconfirm && \
pacman -S expect --noconfirm && \
install-anmp.sh
