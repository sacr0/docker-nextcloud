FROM nextcloud:17.0.1-fpm-alpine

RUN set -ex; \
    \
    apk add --no-cache \
        imagemagick \
        samba-client \
        libsmbclient \
        tzdata 
RUN set -ex; \
    \
    apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        samba-dev \
    ; \
    pecl install smbclient \
    apk del .build-deps \
    && echo "extension=smbclient.so" > /usr/local/etc/php/conf.d/smbclient.ini 
