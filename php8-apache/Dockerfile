FROM php:8.0-apache

# Installing community tool to easiest installation php extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions

# Installing php extentions
RUN install-php-extensions pgsql pdo_pgsql zip xdebug

RUN echo "xdebug.mode=debug" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini"
RUN echo "xdebug.start_with_request=no" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini"

# Installing composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer

RUN set -ex && a2enmod rewrite
RUN set -ex && service apache2 restart

RUN set -ex && apt update && apt install mc -y

VOLUME ["$PHP_INI_DIR/php.ini", "/var/www/html/"]

EXPOSE 9003 80

CMD ["apachectl", "-D", "FOREGROUND"]

