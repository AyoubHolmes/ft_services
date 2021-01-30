#!bin/sh
	openrc default
	/etc/init.d/sshd restart
	/bin/sh
	#while :
	#do
	#	var_nginx=`rc-service nginx status | grep -c 'stopped'`
	#	if [ $var_nginx -eq 1 ]
	#	then
	#		echo "nginx service stopped"
	#		exit
	#	fi
	#done