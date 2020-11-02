#!/bin/sh
sudo service rpcbind start
sudo service nfs-kernel-server start
sudo service nfs-common start
sudo exportfs -a 
sudo mount -t nfs -o v3,proto=tcp,port=2049 172.17.0.2:/mnt/example /home/jovyan/example
