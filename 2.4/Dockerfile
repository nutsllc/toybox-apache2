FROM httpd:2.4.20
MAINTAINER NutsProject,LLC

RUN tar cvzf /usr/src/apache2-default-doc.tar.gz -C /usr/local/apache2/htdocs ./
RUN tar cvzf /usr/src/apache2-conf.tar.gz -C /usr/local/apache2/conf ./

WORKDIR /usr/local/apache2/htdocs

COPY docker-entrypoint-ex.sh /entrypoint-ex.sh

ENTRYPOINT ["/entrypoint-ex.sh"]
