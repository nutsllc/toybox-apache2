# Apache2 on Docker

A Dockerfile for deploying a Apache2 using Docker container.

This ``toybox-apache`` image has been extended [the official httpd image](https://hub.docker.com/_/httpd/) which is maintained in the [docker-library/httpd](https://github.com/docker-library/httpd/tree/12bf8c8883340c98b3988a7bade8ef2d0d6dcf8a) GitHub repository.

This image is registered to the [Docker Hub](https://hub.docker.com/r/nutsllc/toybox-apache2/) which is the official docker image registory.

In addition, this image is compatible with [ToyBox](https://github.com/nutsllc/toybox) complytely to manage the applications on Docker.

## Usage

### The simplest way to run
``docker run -it -p 8080:80 -d nutsllc/toybox-apache2``

### To correspond the gid/uid between inside and outside container

* To find a specific user's UID and GID, at the shell prompt, enter: ``id <username>``

``docker run -it -p 8080:80 -e TOYBOX_GID=1000 -e TOYBOX_UID=1000 -d nutsllc/toybox-apache2``

### Persistent the Apache2 document root contents

``docker run -it -p 8080:80 -v $(pwd)/.datas/docroot:/usr/local/apache2/htdocs -d nutsllc/toybox-apache2``

### Persistent the Apache2 config files

``docker run -it -p 8080:80 -v $(pwd)/.data/conf:/etc/apache2 -d nutsllc/toybox-apache2``

## Docker Compose example
```
toybox-apache2:
	image: nutsllc/toybox-apache2:latest
	volumes:
		- "./.data/htdocs:/usr/local/apache2/htdocs"
		- "./.data/conf:/etc/apache2"
	environment:
		- TOYBOX_UID=1000
		- TOYBOX_GID=1000
	ports:
		- "8080:80"
```

## Contributing

We'd love for you to contribute to this container. You can request new features by creating an [issue](https://github.com/nutsllc/toybox-apache2/issues), or submit a [pull request](https://github.com/nutsllc/toybox-apache2/pulls) with your contribution.