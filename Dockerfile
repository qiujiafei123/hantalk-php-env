FROM php:7.2-cli
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com \
    && apt-get update && apt-get install -y libpng-dev libssl-dev \
    && pecl install mongodb \
    && pecl install redis \
    && docker-php-ext-enable redis mongodb \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo
