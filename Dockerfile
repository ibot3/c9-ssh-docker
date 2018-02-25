FROM ubuntu:16.04

MAINTAINER Jakob Mueller <jakob@ibot3.de>

ENV c9_sshkey=undefined
ENV c9_password=undefined
ENV c9_php=false

SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nano curl openssh-server openssh-client git tar g++ libssl-dev libxml2-dev notejs npm python sudo docker software-properties-common python-software-properties
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN if [ "$c9_php" == "true" ] ; then apt-get install -y software-properties-common python-software-properties && add-apt-repository ppa:ondrej/php && apt-get update && apt-get -y install php7.2 php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml fi

RUN adduser --disabled-password --gecos "" c9

EXPOSE 22

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]