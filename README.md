MongoDB Dockerfile
==================

This repository contains **Dockerfile** of [MongoDB](http://www.mongodb.org) for [Docker](https://www.docker.com).

### Features

- Run `mongod` as `mongodb` user
- Overwrite default `mongodb.conf` with supplied one
- Expose port **22** (ssh), **27017** (mongod) and **28017** (http)
- Use [supervisord](http://supervisord.org) to manage **sshd** and **mongod** execution

### Base image

- [mpangrazzi:debian]

### Installation

`docker pull mpangrazzi/mongodb`

or:

`docker build -t="mpangrazzi/mongodb" github.com/mpangrazzi/docker-mongodb`

### Usage

`docker run -it --rm -p 2222:22 -p 27017:27017 -p 28017:28017 --name mongodb -h mongodb  mpangrazzi/mongodb`

