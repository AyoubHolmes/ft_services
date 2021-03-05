FROM alpine:3.12.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk add influxdb openrc telegraf
RUN openrc && touch /run/openrc/softlevel
COPY ./src/telegraf.conf /etc/telegraf.conf
COPY ./src/run.sh /run.sh
RUN chmod 777 /run.sh 

CMD /run.sh