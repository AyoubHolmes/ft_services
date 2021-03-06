rc-service vsftpd start
rc-service telegraf start

sleep 5

while sleep 2;
    do
        pgrep vsftpd > /dev/null
        vsftpd_status=$?
        if [ $vsftpd_status -ne 0 ]; then
            echo "vsftpd service is not running ..."
            exit 1
        fi
        pgrep telegraf > /dev/null
        telegraf_status=$?
        if [ $telegraf_status  -ne 0 ]; then
            echo "Telegraf service is not running ..."
            exit 1
        fi
    done