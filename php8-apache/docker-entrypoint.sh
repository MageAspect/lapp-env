#!/bin/bash

# Данный docker-entrypoint.sh предоставляет возможность читать и записывать файлы в VOLUME /var/www/html/
# со стороны докер-хоста и со стороны контейнера одновременно,
# путем создания пользователя в контейнере с таким же UID как и у пользователя докер-хоста
# Подробнее https://denibertovic.com/posts/handling-permissions-with-docker-volumes/

# По умолчанию USER_ID равен 1000
USER_ID=${DOCKER_HOST_USER_ID:-1000}
echo "Starting with UID : $USER_ID"
usermod -u "$USER_ID" www-data
chown -R www-data:www-data /var/www/html/

exec "$@"