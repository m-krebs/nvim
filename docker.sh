#!/usr/bin/env sh

docker run -w /root -it --rm alpine:edge sh -uelic "
  apk add git curl wget lazygit neovim ripgrep fzf alpine-sdk --update
        git clone https://m-krebs.dev/nvim ~/.config/nvim
        cd ~/.config/nvim
        git checkout ${NVIM_BRANCH}
        nvim
"
