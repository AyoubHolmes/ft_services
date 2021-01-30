#!bin/sh
	openrc default
	rc-service php-fpm7 start
	rc-service nginx start
	
	/bin/sh