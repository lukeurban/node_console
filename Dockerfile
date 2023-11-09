FROM node:21.1.0

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
RUN apt-get install -y sudo && usermod -aG sudo node
RUN npm install -g nodemon

RUN chmod 777 -R /app

ENV TERM xterm

ENV ZSH_THEME agnoster

ADD ./.zshrc /etc/node/.zshrc
ADD ./.zshrc /etc/root/.zshrc
ADD ./.zshrc /etc/skel/.zshrc
COPY ./mac /mac
COPY ./mac /usr/local/bin/mac
RUN chmod 777 /mac

RUN echo '%sudo  ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
USER node
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN echo "fs.inotify.max_user_instances=524288" >> /etc/sysctl.conf
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
RUN echo "fs.inotify.max_queued_events=524288" >> /etc/sysctl.conf

WORKDIR /app

CMD [ "zsh" ]
