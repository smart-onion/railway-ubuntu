FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install base tools + debootstrap
RUN apt-get update && apt-get install -y \
    debootstrap sudo curl wget nano git \
    && rm -rf /var/lib/apt/lists/*

# Make sure we always have a place to mount Railway volume
RUN mkdir -p /mnt/volume

WORKDIR /mnt/volume

# Entry script: if Ubuntu not installed, install it into /mnt/volume/rootfs
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

CMD ["/entry.sh"]
