FROM php:7.2-cli
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
	&& composer self-update --1 \
    && apt-get update && apt-get install -y wget libpng-dev libssl-dev git\
	&& wget -O phpunit https://phar.phpunit.de/phpunit-7.phar \
	&& chmod +x phpunit \
	&& mv phpunit /usr/local/bin/phpunit \
    && pecl install mongodb \
    && pecl install redis \
    && docker-php-ext-enable redis mongodb \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo
