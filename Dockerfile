FROM php:7.2-alpine3.7

ADD . /src/app/
WORKDIR /src/app

#替换国内镜像
COPY ./source.list /etc/apk/repositories

RUN apk update

ENV COMPOSER_VERSION 1.6.3

RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
 && php composer-setup.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
 && php -r "unlink('composer-setup.php');"

RUN \
  composer config -g repo.packagist composer https://packagist.phpcomposer.com && \
  composer install && \
  cp includes/config.environment.inc.php includes/config.inc.php

EXPOSE 80

ENTRYPOINT [ "php", "-S", "0.0.0.0:80" ]
