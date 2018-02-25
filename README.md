# c9-ssh-docker

docker run -it -d --cap-add=NET_ADMIN -p 7080:80 -p 7022:22 -v /opt/c9/workspace1/:/home/c9/workspace/ -e "c9password=xxx" -e "c9sshkey=ssh-rsa xxx" quay.io/ibot3/c9-ssh-docker
