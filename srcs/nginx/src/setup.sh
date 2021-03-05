#!bin/sh
service nginx start
service telegraf start
/etc/init.d/sshd restart
/bin/sh

sleep 5
while sleep 2;
    do
        pgrep nginx > /dev/null
        nginx_stat= "nginx -t | grep -c 'failed'"
        nginx_status=$?
        if [ $nginx_stat -ne 0 ]; then
            echo "Nginx service is not running ..."
            exit 1
        fi
        pgrep telegraf > /dev/null
        telegraf_status=$?
        if [ $telegraf_status  -ne 0 ]; then
            echo "Telegraf service is not running ..."
            exit 1
        fi
        pgrep sshd > /dev/null
        sshd_status=$?
        if [ $sshd_status  -ne 0 ]; then
            echo "sshd is not running ..."
            exit 1
        fi
    done