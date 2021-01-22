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
RUN apk add openssl 
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
RUN apk update
COPY ./srcs/setup.sh /setup.sh
COPY ./srcs/pwd /pwd
RUN chmod 777 /setup.sh
RUN openrc default

ENTRYPOINT ["/setup.sh" ]