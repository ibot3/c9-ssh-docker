#!/bin/bash

usermod -a -G sudo c9
echo c9:"$c9_password" | /usr/sbin/chpasswd

cd ~
mkdir ".ssh"
mkdir "workspace"

cd ".ssh"
echo "$c9_sshkey" > authorized_keys

cd ~
chown -R c9:c9 *

service ssh start