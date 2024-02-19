FROM php:8.1

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
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'edb40769019ccf227279e3bdd1f5b2e9950eb000c3233ee85148944e555d97be3ea4f40c3c2fe73b22f875385f6a5155') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer; \
    php -r "unlink('composer-setup.php');"; \
    composer selfupdate 2.2.23

COPY default-php.ini /usr/local/etc/php/conf.d/
