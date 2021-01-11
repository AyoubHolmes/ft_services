	#!bin/sh

	openrc default > /dev/null
	rc-service nginx start
	rc-service nginx status
    while :
    do
            var_nginx=`rc-service nginx status | grep -c 'not running'`
            if [ $var_nginx -eq 1 ]
            then
                    echo "nginx service stopped"
                    exit
            fi
    done