# toybox-apache2

## Usage Example (using Docker)

``docker run -it -p 8080:80 -d toybox/apache2``

## An assimilating GID and UID of host user into container

``docker run -it -p 8080:80 -e TOYBOX_GID=1000 -e TOYBOX_UID=1000 -d toybox/apache2``

## Persistent Volumes

### Document Root

``docker run -it -e TOYBOX_GID=1000 -e TOYBOX_UID=1000 -v $(pwd):/var/www/html -d toybox/apache2``

### Config files

``docker run -it -e TOYBOX_GID=1000 -e TOYBOX_UID=1000 -v $(pwd):/etc/apache2 -d toybox/apache2``
