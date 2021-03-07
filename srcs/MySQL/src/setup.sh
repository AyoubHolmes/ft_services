service telegraf start

if [ ! -d "/var/lib/mysql/wordpress/" ]; then
    /etc/init.d/mariadb setup
    rc-service mariadb start
    mysql -e "CREATE USER 'user'@'%' IDENTIFIED BY 'user'"
    mysql -e "CREATE DATABASE wordpress;"
    mysql < /wordpress.sql
    mysql -e "GRANT ALL ON *.* to 'user'@'%' IDENTIFIED BY 'user';"
    mysql -e "FLUSH PRIVILEGES;"
    rc-service mariadb stop
fi

# service mariadb restart
mysqld_safe &

sleep 5
while sleep 2;
    do
        pgrep mysql > /dev/null
        mariadb_status=$?
        if [ $mariadb_status  -ne 0 ]; then
            echo "Mariadb service is not running ..."
            exit 1
        fi
        pgrep telegraf > /dev/null
        telegraf_status=$?
        if [ $telegraf_status  -ne 0 ]; then
            echo "Telegraf service is not running ..."
            exit 1
        fi
    done