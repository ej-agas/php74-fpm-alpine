FROM php:7.4.16-fpm-alpine

RUN apk add --no-cache \
    tzdata \
    coreutils \
    acl \
    bash \
    vim \
    curl \
    curl-dev \
    supervisor \
    sqlite-dev \
    libzip-dev \
    libxml2-dev \
    libxslt-dev \
    libsodium-dev \
    icu-dev \
    oniguruma-dev

RUN ln -s /usr/share/zoneinfo/Asia/Manila /etc/localtime

RUN docker-php-ext-install \
    bcmath \
    opcache \
    iconv \
    mysqli \
    pdo \
    pdo_mysql \
    pdo_sqlite \
    zip \
    xml \
    xsl \
    intl \
    json \
    mbstring \
    curl \
    simplexml \
    soap \
    sockets \
    bcmath \
    sodium \
    && rm -rf /tmp/* /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000
CMD ["php-fpm"]