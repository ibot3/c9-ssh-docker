FROM ubuntu:16.04

MAINTAINER Jakob Müller <jakob@ibot3.de>

ENV c9_sshkey=undefined
ENV c9_password=undefined

SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nano wget curl openssh-server openssh-client git tar g++ libssl-dev libxml2-dev nodejs npm python sudo docker software-properties-common python-software-properties
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && apt-get update && apt-get install -y --allow-unauthenticated php7.2 php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml php7.2-gettext php7.2-bcmath
RUN sed -i 's/%sudo\s.*/%sudo ALL=NOPASSWD:ALL/' /etc/sudoers
RUN mkdir -p /home/c9/logs/ && php -r "ini_set('error_reporting', E_ALL); ini_set('error_log', '/home/c9/logs/php-error.log');"

RUN adduser --disabled-password --gecos "" c9

USER c9
ENV HOME /home/c9

RUN mkdir -p ~/bin && curl -L http://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -o ~/bin/php-cs-fixer && chmod a+x ~/bin/php-cs-fixer
RUN cd ~ && curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash

USER root

EXPOSE 22

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]