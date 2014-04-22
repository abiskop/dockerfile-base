FROM phusion/baseimage:latest

ENV HOME /root
WORKDIR /root

CMD ["/sbin/my_init"]
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe > /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise-updates main universe >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y --no-install-recommends

# Install basic packages.
RUN apt-get install -y software-properties-common
RUN apt-get install -y curl git htop unzip vim wget

# Increase limits
RUN echo '1' > /proc/sys/vm/overcommit_memory
RUN echo 'hard nofile 16384\nsoft nofile 16384' > /etc/security/limits.d/my.conf

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
