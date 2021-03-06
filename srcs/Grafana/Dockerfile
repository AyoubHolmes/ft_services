FROM alpine:3.12.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk add wget openrc libc6-compat telegraf
RUN openrc && touch /run/openrc/softlevel
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.3.linux-amd64.tar.gz
RUN mv grafana-7.4.3 grafana
RUN rm grafana-7.4.3.linux-amd64.tar.gz
RUN sed -i "s/disable_initial_admin_creation/# disable_initial_admin_creation/g" /grafana/conf/defaults.ini
COPY ./src/grafana.db /grafana/data/grafana.db
COPY ./src/telegraf.conf /etc/telegraf.conf
COPY ./src/setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD /setup.sh


#RUN apk add --update binutils | readelf -l your_executable|grep "program interpreter"