#!/bin/bash

usermod -a -G sudo c9
echo c9:"$c9_password" | /usr/sbin/chpasswd

su c9

cd ~
mkdir .ssh
mkdir workspace
echo "$c9_sshkey" > .ssh/authorized_keys