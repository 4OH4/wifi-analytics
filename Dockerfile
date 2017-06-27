FROM armv7/armhf-ubuntu:14.04

MAINTAINER 4oh4 <4oh4.git@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN sudo date +%Y%m%d -s "20170627"

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
    tshark \
    wget \
    wireless-tools && rm -rf /var/lib/apt/lists/*
	
# Update date
RUN sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
	
#RUN pip3 install uwsgi django

# Get the SSID hoover script
RUN cd /tmp && \
	wget https://github.com/xme/hoover/blob/master/hoover.pl

#EXPOSE 80
CMD ["/bin/bash"] #, "/home/django/start.sh"]
