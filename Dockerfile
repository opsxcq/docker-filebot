FROM debian:9.2

LABEL maintainer "opsxcq@strm.sh"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget curl default-jre \
    libmediainfo0v5 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    wget -O filebot.deb 'https://app.filebot.net/download.php?type=deb&arch=amd64' && \
    dpkg -i filebot.deb && \
    rm filebot.deb

VOLUME /data
WORKDIR /data
