FROM ubuntu:16.04

MAINTAINER Rupert Thomas <rupert@rupertthomas.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    git \
    vim \
    python3 \
    python3-pip \
    nginx \
    supervisor \
    mysql-server \
    mysql-client \
    libmysqld-dev \
    pwgen \
	npt \
	tshark && rm -rf /var/lib/apt/lists/*
	
RUN pip3 install uwsgi django


#EXPOSE 80
#CMD ["/bin/bash", "/home/django/start.sh"]
