#!/bin/bash

usermod -a -G sudo c9
echo c9:"$c9_password" | /usr/sbin/chpasswd

cd /home/c9/
mkdir -p .ssh

cd /home/c9/.ssh
echo "$c9_sshkey" > authorized_keys

cd /home/c9/
chown -R c9:c9 *

service ssh start