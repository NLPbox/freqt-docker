
FROM ubuntu:14.04

MAINTAINER Arne Neumann <nlpdocker.programming@arne.cl>

RUN apt-get update && apt-get install -y wget make g++

WORKDIR /opt
RUN wget http://chasen.org/~taku/software/freqt/freqt-0.22.tar.gz
RUN tar -xzvf freqt-0.22.tar.gz && rm freqt-0.22.tar.gz

WORKDIR /opt/freqt-0.22
#RUN apt-get install -y build-essential
RUN make && make test
WORKDIR /usr/bin
RUN ln -s /opt/freqt-0.22/freqt
WORKDIR /opt/freqt-0.22
