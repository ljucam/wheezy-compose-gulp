FROM debian:wheezy
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL -o setup https://deb.nodesource.com/setup_5.x && bash setup && rm setup && \
    apt-get install -y nodejs && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose &&
    npm install gulp -g
CWD /root
ADD package.json /root/
RUN npm install
CMD gulp
