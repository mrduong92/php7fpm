FROM php:7.1-fpm

MAINTAINER mrduong92, mrduong.92@gmail.com

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \ 
    libmcrypt-dev \ 
    libpng12-dev \
    vim \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring pdo_mysql \ 
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \ 
    && docker-php-ext-install -j$(nproc) gd