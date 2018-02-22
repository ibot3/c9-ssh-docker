FROM ubuntu:16.04

MAINTAINER Jakob Mueller <jakob@ibot3.de>

ARG sshkey=undefined
ARG password=undefined

RUN apt-get update
RUN apt-get install -y nano curl openssh-server openssh-client git tar g++ libssl-dev libxml2-dev nodejs python
RUN service ssh start

RUN adduser --disabled-password --gecos "" c9 && usermod -a -G sudo c9 && echo $password | passwd theUsername --stdin

USER c9

RUN cd ~ && mkdir .ssh && echo $sshkey > .ssh/authorized_keys
RUN cd ~ && mkdir workspace

EXPOSE 22