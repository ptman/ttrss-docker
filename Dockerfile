# vim: set ft=dockerfile:
FROM ptman/alpine-s6:latest
# Author with no obligation to maintain
MAINTAINER Paul Tötterman <paul.totterman@iki.fi>

ENV DB_HOST="postgres" \
    DB_NAME="ttrss" \
    DB_USER="ttrss" \
    DB_PASS="" \
    BASE_URL="http://example.com/ttrss/" \
    FEED_CRYPT_KEY="" \
    MAIL_REGISTRATIONS="registrations@example.com" \
    MAIL_SENDER="Tiny Tiny RSS" \
    MAIL_FROM="noreply@example.com" \
    MAIL_HOST="localhost" \
    MAIL_USER="ttrss" \
    MAIL_PASS="" \
    MAIL_SECURE="tls"

RUN apk --no-cache add php-fpm php-json php-iconv php-pgsql php-dom php-curl php-mcrypt openssl \
    && wget -O /ttrss.tar.gz https://tt-rss.org/gitlab/fox/tt-rss/repository/archive \
    && mkdir /opt \
    && tar -xz -C /opt -f /ttrss.tar.gz \
    && rm -f /ttrss.tar.gz \
    && mv /opt/tt-rss.git /opt/ttrss \
    && sed -i \
    -e 's|^listen =.*$|listen = 9000|' \
    -e 's|;daemonize =.*$|daemonize = no|' \
    /etc/php/php-fpm.conf
COPY cont-init.d/ /etc/cont-init.d/
COPY fix-attrs.d/ /etc/fix-attrs.d/
COPY services.d/ /etc/services.d/

VOLUME /opt/ttrss
EXPOSE 9000
