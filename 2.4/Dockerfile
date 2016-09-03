FROM httpd:2.4.23
MAINTAINER NutsProject,LLC

RUN tar cvzf /usr/src/apache2-default-doc.tar.gz -C /usr/local/apache2/htdocs ./ \
    && tar cvzf /usr/src/apache2-conf.tar.gz -C /etc/apache2 ./

WORKDIR /usr/local/apache2/htdocs

COPY docker-entrypoint-ex.sh /entrypoint-ex.sh

ENTRYPOINT ["/entrypoint-ex.sh"]
