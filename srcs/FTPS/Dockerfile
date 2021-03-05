FROM alpine:3.12.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk add openrc openssl vsftpd vim telegraf
RUN openrc && touch /run/openrc/softlevel
RUN echo -e "azerty\nazerty" | adduser user
RUN echo "user" | tee -a /etc/vsftpd.userlist
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
COPY ./src/vsftpd.conf /etc/vsftpd/vsftpd.conf 
COPY ./src/telegraf.conf /etc/telegraf.conf
COPY ./src/setup.sh /setup.sh
RUN chmod +x setup.sh

CMD ./setup.sh

