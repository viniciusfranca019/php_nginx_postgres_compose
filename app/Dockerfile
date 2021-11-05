FROM php:8.0.10-fpm-alpine3.13

RUN apk update

RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS openssl \
    bash-doc bash-completion postgresql-dev zlib-dev php-phpdbg \
    libzip-dev libpng-dev jpegoptim optipng pngquant gifsicle nginx \
    libpng sqlite-dev sqlite php8-phpdbg php-soap libxml2-dev \
    git openssh

RUN docker-php-ext-install pdo \
    pdo_pgsql \
    sockets \
    soap \
    gd \
    zip \
    bcmath \
    pdo_sqlite

WORKDIR /var/www

RUN ls -la

RUN rm -rf /var/www/html

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN ln -s public html

EXPOSE 9000

RUN php artisan cache:clear
