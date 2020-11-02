FROM jlphillips/csci4850

LABEL maintainer="Jessica Wijaya"

USER root

RUN apt-get update && \
    apt-get install -y \
    dnsutils \
    rpcbind \
    nfs-kernel-server \
    nfs-common \
    kmod \
    && apt-get clean

RUN mkdir /home/jovyan/example
RUN mkdir /mnt/example
RUN sudo echo "/mnt/example 172.17.0.2(rw,no_root_squash,subtree_check)" >> /etc/export
RUN sudo service rpcbind start
RUN sudo service nfs-kernel-server start
RUN sudo service nfs-common start
RUN sudo exportfs -a
RUN sudo mount -t nfs -o v3,proto=tcp,port=2049 172.17.0.2:/mnt/example /home/jovyan/example

USER root
