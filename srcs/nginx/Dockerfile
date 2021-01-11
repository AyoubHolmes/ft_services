FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/index.html /www/index.html
RUN apk add openrc
RUN rc-update add nginx default
COPY ./srcs/testing.sh /testing.sh
RUN chmod 777 /testing.sh

EXPOSE 80 443
CMD [ "sh", "/testing.sh" ]