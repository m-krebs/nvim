FROM alpine:3.19.1

RUN apk update; \
  apk add git curl vim neovim neovim-doc build-base bash make ripgrep ; \
  alias vim=nvim

COPY .. /root/.config/nvim

WORKDIR /root/.config/nvim

ENTRYPOINT [ "nvim" ]
