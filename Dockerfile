FROM ubuntu:16.04

MAINTAINER Jakob Mueller <jakob@ibot3.de>

ARG sshkey=undefined
ARG password=undefined

SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get install -y nano curl openssh-server openssh-client git tar g++ libssl-dev libxml2-dev nodejs python
RUN service ssh start

RUN adduser --disabled-password --gecos "" c9 && usermod -a -G sudo c9 && echo c9:$password | /usr/sbin/chpasswd

USER c9

RUN cd ~ && mkdir .ssh && echo $sshkey > .ssh/authorized_keys
RUN cd ~ && mkdir workspace

EXPOSE 22