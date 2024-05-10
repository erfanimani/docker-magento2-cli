FROM php:8.3

MAINTAINER Erfan Imani <contact@erfanimani.com>

WORKDIR /app

RUN apt-get update && apt-get install -y \
  cron \
  git \
  rsync \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libxslt1-dev \
  default-mysql-client \
  libzip-dev \
  zip


RUN docker-php-ext-configure \
  gd --with-freetype --with-jpeg

RUN docker-php-ext-install \
  bcmath \
  gd \
  intl \
  opcache \
  pdo_mysql \
  soap \
  xsl \
  zip \
  sockets


RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer; \
    php -r "unlink('composer-setup.php');"

COPY default-php.ini /usr/local/etc/php/conf.d/
