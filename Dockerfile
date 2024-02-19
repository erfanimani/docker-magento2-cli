FROM php:8.2

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

# Locking composer to 2.2 until Magento 2.4.7 comes out
# @see https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/system-requirements.html

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer; \
    php -r "unlink('composer-setup.php');"; \
    composer selfupdate 2.2.22

COPY default-php.ini /usr/local/etc/php/conf.d/
