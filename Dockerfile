
#
# MongoDB
#

FROM mpangrazzi/debian

MAINTAINER Michele Pangrazzi <xmikex83@gmail.com>

# Install MongoDB

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org openssh-server supervisor

# Copy mongod conf

COPY mongod.conf /etc/mongod.conf

# Data storage

VOLUME /data/db
RUN chown -R mongodb:mongodb /data/db

# Install and setup supervisor

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Adding root / nano user for SSH access

RUN mkdir -p /var/run/sshd
RUN echo 'root:nano' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Launch supervisor

CMD ["/usr/bin/supervisord"]

# Expose mongod, MongoDB HTTP interface, SSH

EXPOSE 27017 28017 22
