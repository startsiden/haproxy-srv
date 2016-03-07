FROM debian:jessie-backports

# RUN apt-get install haproxy
# FROM ubuntu-debootstrap:14.04
RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy curl netcat tcpdump dnsutils
RUN DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports install -qy haproxy
# RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy nodejs
# RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy vim
RUN apt-get clean

COPY haproxy.cfg /etc/haproxy/haproxy.cfg

CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg"]
