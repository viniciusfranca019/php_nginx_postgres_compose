#!/bin/bash

cp -R -u -p .env.development .env
sleep 1
composer install

chown -R www-data: /var/www/
chmod 777 -R /var/www/

sleep 1

php artisan cache:clear

php-fpm
