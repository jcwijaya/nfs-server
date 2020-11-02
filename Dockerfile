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
RUN sudo echo "/mnt/example 172.17.0.2(rw,no_root_squash,subtree_check)" >> /etc/exports
COPY start.sh /usr/local/bin/before-notebook.d/start.sh

USER root
