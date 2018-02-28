# c9-ssh-docker

docker run -it -d --cap-add=NET_ADMIN -p 7080:8080 -p 7022:22 -v /opt/c9/workspace1/:/home/c9/workspace/ -e "c9_password=xxx" -e "c9_sshkey=ssh-rsa xxx" quay.io/ibot3/c9-ssh-docker
