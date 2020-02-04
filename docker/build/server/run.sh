#!/bin/bash

if [ "$RUN_COMPOSER" ]; then
    cd /var/app
    composer install
fi

source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND
