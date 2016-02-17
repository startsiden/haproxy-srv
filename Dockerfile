FROM debian:jessie

# RUN apt-get install haproxy
# FROM ubuntu-debootstrap:14.04
RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy haproxy curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy nodejs
RUN apt-get clean

COPY package.json /src/

RUN cd /src; npm install

COPY start.js haproxy.cfg.template /src/

CMD ["node", "/src/start.js"]
