FROM httpd:2.4-alpine
MAINTAINER NutsProject,LLC

RUN apk add --no-cache tar \
    && mkdir -p /usr/src \
    && tar czf /usr/src/apache2-default-doc.tar.gz -C /usr/local/apache2/htdocs ./ \
    && tar czf /usr/src/apache2-conf.tar.gz -C /usr/local/apache2/conf ./

WORKDIR /usr/local/apache2/htdocs

COPY docker-entrypoint-ex.sh /entrypoint-ex.sh

ENTRYPOINT ["/entrypoint-ex.sh"]
