#!/bin/bash
set -e

user="www-data"
group="www-data"

usermod -u ${TOYBOX_UID} ${user}
groupmod -g ${TOYBOX_GID} ${group}

docroot="/var/www/html"
mkdir -p ${docroot}
tar xvzf /usr/src/apache2-default-doc.tar.gz -C ${docroot}
chown -R ${user}:${group} ${docroot}

confdir="/etc/apache2"
mkdir -p ${confdir}
tar xvzf /usr/src/apache2-conf.tar.gz -C ${confdir}
chown -R ${user}:${group} ${confdir}

exec httpd-foreground
