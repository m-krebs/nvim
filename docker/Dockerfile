FROM alpine:3.19.1

RUN apk update

RUN apk add git curl vim neovim

COPY .. /root/.config/nvim

ENTRYPOINT [ "nvim" ]
