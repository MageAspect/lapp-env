run:
	docker run -d --name php8-apache \
	 --mount type=bind,source=$(shell pwd)/php.ini,target=/usr/local/etc/php/php.ini \
	 php8
build:
	docker build . -t php8
rmi:
	docker rmi php8