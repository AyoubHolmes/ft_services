FROM alpine:3.12.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk add mysql mysql-client openrc telegraf
RUN openrc && touch /run/openrc/softlevel
RUN sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
COPY ./src/setup.sh /setup.sh
COPY ./src/wordpress.sql /wordpress.sql
COPY ./src/telegraf.conf /etc/telegraf.conf
RUN chmod 777 /setup.sh 


CMD /setup.sh