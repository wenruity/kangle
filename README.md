FROM ubuntu:latest

RUN apt-get update
RUN apt-get install make
RUN apt-get install gcc build-essential -y
RUN apt-get install libpcre3 libpcre3-dev
RUN apt-get install openssl 
RUN apt-get install libssl-dev
RUN apt-get install sqlite
RUN apt-get install lib32stdc++6

ADD ./ http://download.kanglesoft.com/src/kangle-3.4.2.tar.gz 

RUN ./configure --prefix=/usr/local/kangle
RUN make && make install

ENTRYPOINT ["./src/kangle", "run"]
 
