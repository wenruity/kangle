FROM ubuntu:latest
MAINTAINER Docker

RUN apt-get update
RUN apt-get install make
RUN apt-get install gcc build-essential -y
RUN apt-get install libpcre3 libpcre3-dev
RUN apt-get install openssl 
RUN apt-get install libssl-dev
RUN apt-get install sqlite
RUN apt-get install lib32stdc++6


RUN mkdir -p /usr/src && wget -SL http://download.kanglesoft.com/src/kangle-3.4.2.tar.gz
RUN tar xzf kangle-3.4.2.tar.gz && cd kangle-3.4.2

RUN /usr/src/kangle-3.4.2/configure --prefix=/usr/local/kangle && make && make install

ENTRYPOINT ["/usr/src/kangle-3.4.2/src/kangle", "run"] 
