# toybox-apache2

# Usage Example (using Docker)

``docker run -it -e TOYBOX_GID=1000 -e TOYBOX_UID=1000 -d toybox/apache2``

# Persistent Volumes

### Document Root

``docker run -it -e TOYBOX_GID=1000 -e TOYBOX_UID=1000 -v $(pwd):/var/www/html -d toybox/apache2``

### Config files

``docker run -it -e TOYBOX_GID=1000 -e TOYBOX_UID=1000 -v $(pwd):/etc/apache2 -d toybox/apache2``
