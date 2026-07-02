FROM php:8.1-apache

# 1. Installazione dipendenze di sistema (rimosso libc-client)
RUN apt-get update && apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    libkrb5-dev \
    libxml2-dev \
    libxslt1-dev \
    libkrb5-dev \
    libssl-dev \
    curl \
    libcurl4-openssl-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 2. Configurazione e installazione moduli PHP standard (rimosso imap)
RUN docker-php-ext-install -j$(nproc) \
    calendar \
    ctype \
    dom \
    exif \
    fileinfo \
    filter \
    ftp \
    gettext \
    mysqli \
    pdo_mysql \
    shmop \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    xsl \
    opcache \
    curl

# 3. Installazione Imagick tramite PECL
RUN pecl install imagick \
    && docker-php-ext-enable imagick

# Abilitiamo il modulo rewrite di Apache per i permalink/htaccess
RUN a2enmod rewrite
