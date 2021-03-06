#!bin/sh
rc-service php-fpm7 start
rc-service nginx start
rc-service telegraf start

sleep 5
while sleep 2;
    do
        pgrep nginx > /dev/null
        nginx_status=$?
        if [ $nginx_status -ne 0 ]; then
            echo "Nginx service is not running ..."
            exit 1
        fi
        pgrep telegraf > /dev/null
        telegraf_status=$?
        if [ $telegraf_status  -ne 0 ]; then
            echo "Telegraf service is not running ..."
            exit 1
        fi
        pgrep php-fpm7 > /dev/null
        php_fpm7_status=$?
        if [ $php_fpm7_status -ne 0 ]; then
            echo "php-fpm7 is not running ..."
            exit 1
        fi
    done