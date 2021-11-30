FROM php:8.0-apache

VOLUME ["$PHP_INI_DIR/php.ini", "/var/www/html/"]
EXPOSE 9003 80

ARG DEBIAN_FRONTEND=noninteractive

# Installing community tool to easiest installation php extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions

# Installing php extentions
RUN install-php-extensions pgsql pdo_pgsql zip xdebug

RUN echo "xdebug.mode=develop,debug" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini"
RUN echo "xdebug.start_with_request=yes" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini"

# Installing composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer

# Enable apache rewrite module
RUN set -ex && a2enmod rewrite

# Apache should listen post 8080
RUN set -ex && sed -i 's/Listen 80/Listen 8080/gI' /etc/apache2/ports.conf

RUN set -ex && apt update && apt install mc -y

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN set -ex && chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["apachectl", "-D", "FOREGROUND"]
