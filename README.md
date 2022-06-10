## Inception

### About

Infrastructure for a website, consisting of various services in Docker, configured with docker-compose utility.

### Containers

* NGINX with TLSv1.2 / TLSv1.3 and SSL certificate
* WordPress + php-fpm
* MariaDB

### Volumes

* Database
* WordPress website files

### Networks

* Docker bridge network between containers

### Requirements & usage
Project requires:
* Makefile
* Docker
* docker-compose

Tested on:
* Linux Ubuntu 20.04

Run:
```
$> make
```

Makefile commands:
* make / make all - start containers
* make clean - stop & clean all images/volumes/containers/networks
* make fclean - stop & clean all images/volumes/containers/networks and cached files
* make re - stop and rebuild containers
