FROM nextcloud:19.0.4-fpm-alpine

RUN set -ex; \
    \
    apk add --no-cache \
        imagemagick \
        samba-client \
        tzdata 
RUN set -ex; \
    \
    apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        samba-dev \
    ; \
    pecl install smbclient; \
    docker-php-ext-enable smbclient; \
    apk del .build-deps
