#!/bin/bash
set -e

user="www-data"
group="www-data"

if [ -n "${TOYBOX_GID}" ] && ! cat /etc/group | awk 'BEGIN{ FS= ":" }{ print $3 }' | grep ${TOYBOX_GID} > /dev/null 2>&1; then
    if [ type groupmod ]; then
        groupmod -g ${TOYBOX_GID} ${group}
        echo "GID of ${user} has been changed."
    else
        sed -i -e "s/^\(${user}:x:[0-9]*:\)[0-9]*\(:.*\)$/\1${TOYBOX_GID}\2/" /etc/passwd
        sed -i -e "s/^\(${group}:x:\)[0-9]*\(:.*\)$/\1${TOYBOX_GID}\2/" /etc/group
        echo "GID of ${group} has been changed."
    fi
fi

if [ -n "${TOYBOX_UID}" ] && ! cat /etc/passwd | awk 'BEGIN{ FS= ":" }{ print $3 }' | grep ${TOYBOX_UID} > /dev/null 2>&1; then
    if [ type usermod ]; then
        usermod -u ${TOYBOX_UID} ${user}
        echo "GID of ${group} has been changed."
    else
        sed -i -e "s/^\(${user}:x:\)[0-9]*\(:[0-9]*:.*\)$/\1${TOYBOX_UID}\2/" /etc/passwd
        echo "UID of ${user} has been changed."
    fi
fi

docroot="/usr/local/apache2/htdocs"
mkdir -p ${docroot}
tar xzf /usr/src/apache2-default-doc.tar.gz -C ${docroot}
chown -R ${user}:${group} ${docroot}

confdir="/usr/local/apache2"
mkdir -p ${confdir}
tar xzf /usr/src/apache2-conf.tar.gz -C ${confdir}
sed -i -e "s/^\(User \).*$/\1${user}/" /usr/local/apache2/conf/httpd.conf
sed -i -e "s/^\(Group \).*$/\1${group}/" /usr/local/apache2/conf/httpd.conf
chown -R ${user}:${group} ${confdir}

exec httpd-foreground
