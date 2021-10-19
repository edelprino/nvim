FROM alpine:latest

RUN apk add neovim --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add curl
RUN apk add git
WORKDIR /root/.config/nvim
COPY init.vim init.vim
COPY plugins.vim plugins.vim
COPY lua lua
RUN curl -fLo /root/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim --headless --clean -c 'source plugins.vim'

CMD ["nvim"]
