FROM wordpress:php8.2-apache

RUN a2enmod ssl

COPY apache.conf /etc/apache2/sites-enabled/000-default.conf
COPY php.ini /usr/local/etc/php/conf.d/custom.ini
