FROM ubuntu:18.04

RUN \
 apt-get update && \
  apt-get install -y \
    samba \
    samba-vfs-modules

RUN apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

EXPOSE 137/udp 138/udp 139 445

ENTRYPOINT ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
