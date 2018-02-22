FROM ubuntu:16.04

MAINTAINER Jakob Mueller <jakob@ibot3.de>

ENV c9_sshkey=undefined
ENV c9_password=undefined

SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get install -y nano curl openssh-server openssh-client git tar g++ libssl-dev libxml2-dev nodejs python sudo

RUN adduser --disabled-password --gecos "" c9

EXPOSE 22

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]

USER c9