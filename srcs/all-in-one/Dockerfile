FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN echo "<h1>Hello world!</h1>" > /www/index.html
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
RUN apk add openrc
RUN rc-update add nginx default
###################
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv /wordpress /www/wordpress
RUN ln -s /www/wordpress /var/www/localhost/htdocs/wordpress
RUN rc-update add php-fpm7 default
###################
COPY ./srcs/setup.sh /setup.sh
RUN chmod 777 /setup.sh

ENTRYPOINT ["/setup.sh" ]