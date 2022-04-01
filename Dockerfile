FROM node:16.14.0

RUN apt-get update && apt-get install -y \
    curl \
    git \
    zsh \
    nano \
    mc \
    apt-utils

RUN npm install -g n
RUN npm i -g @nestjs/cli
RUN npm i -g @angular/cli
RUN mkdir /app
RUN apt-get install make
RUN usermod --shell /bin/zsh node
# Install Docker CLI
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

RUN chmod 777 -R /app

ENV TERM xterm

ENV ZSH_THEME agnoster

ADD ./.zshrc /home/node/.zshrc

RUN  npm install -g nodemon

USER node

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR /app



CMD [ "zsh" ]
