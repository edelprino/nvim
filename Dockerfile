FROM alpine:latest

RUN apk add neovim --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY . ~/.config/nvim
RUN nvim +PlugInstall! +qall

CMD ["nvim"]
