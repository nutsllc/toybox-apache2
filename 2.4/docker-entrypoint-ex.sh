#!/bin/bash
set -e

user="www-data"
group="www-data"

if [ -n "${TOYBOX_GID+x}" ]; then
    groupmod -g ${TOYBOX_GID} ${group}
fi

if [ -n "${TOYBOX_UID+x}" ]; then
    usermod -u ${TOYBOX_UID} ${user}
fi

docroot="/usr/local/apache2/htdocs"
mkdir -p ${docroot}
tar xvzf /usr/src/apache2-default-doc.tar.gz -C ${docroot}
chown -R ${user}:${group} ${docroot}

confdir="/etc/apache2"
mkdir -p ${confdir}
tar xvzf /usr/src/apache2-conf.tar.gz -C ${confdir}
chown -R ${user}:${group} ${confdir}

exec httpd-foreground
