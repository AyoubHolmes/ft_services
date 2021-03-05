service telegraf start

# if [-d "/var/lib/mysql/wordpress"]
    /etc/init.d/mariadb setup
    echo "service is running \n\n\n"
    rc-service mariadb start
    mysql -e "CREATE USER 'user'@'%' IDENTIFIED BY 'user'"
    mysql -e "CREATE DATABASE wordpress;"
    mysql -e "GRANT ALL ON *.* to 'user'@'%' IDENTIFIED BY 'user';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql < /wordpress1.sql
# fi

service mariadb restart
# mysql_safe &

sleep 5
while sleep 2;
    do
        mariadb_status=`rc-service mariadb status | grep -c 'start'`
        if [ $mariadb_status -ne 1 ]; then
            echo "mariadb service is not running ..."
            exit 1
        fi
        pgrep telegraf > /dev/null
        telegraf_status=$?
        if [ $telegraf_status  -ne 0 ]; then
            echo "Telegraf service is not running ..."
            exit 1
        fi
    done