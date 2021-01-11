    #!bin/bash

    rc-service nginx status
    while ((1))
    do
            var_nginx=`service nginx status | grep -c 'not running'`
            if [ $var_nginx -eq 1 ]
            then
                    echo "nginx service stopped"
                    exit
            fi
    done