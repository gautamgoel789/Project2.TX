FROM php:8.1-apache

RUN a2enmod rewrite
RUN docker-php-ext-install mysqli

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

RUN a2dissite 000-default.conf
# optionally add your own site config and enable it here

EXPOSE 80
