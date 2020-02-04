FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=newt

RUN apt-get -y update && apt-get install -y \
apache2 \
php7.2 \
libapache2-mod-php7.2 \
php7.2-bcmath \
php7.2-gd \
php7.2-json \
php7.2-sqlite \
php7.2-mysql \
php7.2-curl \
php7.2-xml \
php7.2-mbstring \
php7.2-zip \
mcrypt \
nano

### config PHP
### we want a dev server which shows PHP errors
RUN sed -i -e 's/^error_reporting\s*=.*/error_reporting = E_ALL/' /etc/php/7.2/apache2/php.ini
RUN sed -i -e 's/^display_errors\s*=.*/display_errors = On/' /etc/php/7.2/apache2/php.ini
RUN sed -i -e 's/^zlib.output_compression\s*=.*/zlib.output_compression = Off/' /etc/php/7.2/apache2/php.ini

# to be able to use "nano" with shell on "docker exec -it [CONTAINER ID] bash"
ENV TERM xterm

# Apache conf
## allow .htaccess with RewriteEngine
RUN a2enmod rewrite

## to see live logs we do : docker logs -f [CONTAINER ID]
## without the following line we get "AH00558: apache2: Could not reliably determine the server's fully qualified domain name"
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

## autorise .htaccess files
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

## for production :
# RUN echo "ServerTokens Prod\n" >> /etc/apache2/apache2.conf
# RUN echo "ServerSignature Off\n" >> /etc/apache2/apache2.conf

#RUN chown -R www-data:www-data /var/www
#RUN chmod 755 -R /var/www
RUN chgrp -R www-data /var/www
RUN find /var/www -type d -exec chmod 775 {} +
RUN find /var/www -type f -exec chmod 664 {} +

EXPOSE 80

# start Apache2 on image start
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
