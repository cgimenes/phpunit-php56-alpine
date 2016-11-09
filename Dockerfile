FROM php:5.6-alpine

RUN apk --update add build-base autoconf zlib-dev --no-cache

RUN pecl install xdebug
RUN pecl install memcache
RUN docker-php-ext-enable xdebug
RUN docker-php-ext-enable memcache

RUN docker-php-ext-install mysqli calendar zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN composer global require phpunit/phpunit:3.7.31
RUN ln -s /root/.composer/vendor/bin/phpunit /bin/phpunit

WORKDIR /app
