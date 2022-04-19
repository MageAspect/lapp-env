# lapp-env
 Docker веб-окружение DEBIAN + PHP-8.0 + APACHE + POSTGRES-13.5 для разработки. Поддерживает удаленную отладку xdebug в схеме: рабочий компьютер <-> веб-окружение на VPS.
Позволяет apache редактировать/добавлять/удалять файлы внутри volume с приложением.  

## Требования
1) Linux, т.к. внутри docker-compose используется network_mode: "host" - с ней Docker-host и контейнеры из docker-compose.yml начинают работать без сетевой изоляции. Именно эта настройка позволяет пользоваться удалённой отладкой.
2) Свобоные порты 80, 9003, 5432. Опять же из-за network_mode: "host" :)

## Установка и использование

1) Клонирование и запуск веб-окружения
```
$ git clone https://github.com/MageAspect/lapp-env.git
$ mkdir www
$ cd lapp-env
$ docker-compose up -d
```
2) Загрузить код вашего сайта в ранее созданную папку www - она же корень сайта.

## Удаленная отладка рабочий компьютер <-> VPS

#### Для пользователей windows
1) Установить программу [putty](https://www.putty.org/) и 
2) настроить [Remote Port Forwarding](https://phoenixnap.com/kb/ssh-port-forwarding#ftoc-heading-6) с 9003 порта(Source port) на localhost:9003 (Destination)

#### Для пользователей linux
ssh –R 9003:localhost:9003 user@vsp.server.com

Всё, теперь можно принимать подключения xdebug через PhpStorm
