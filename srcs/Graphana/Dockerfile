FROM alpine:latest
RUN apk update
RUN apk add grafana

COPY ./src/setup.sh /setup.sh
RUN chmod 777 /setup.sh
EXPOSE 3000


ENTRYPOINT ["/setup.sh" ]