FROM alpine:3.12.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx sudo openssl openrc openssh telegraf
RUN openrc && touch /run/openrc/softlevel
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN echo "<h1>Hello world!</h1>" > /www/index.html
COPY ./src/nginx.conf /etc/nginx/nginx.conf
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
RUN rm /etc/ssh/sshd_config
COPY ./src/ssh.conf /etc/ssh/sshd_config
COPY ./src/setup.sh /setup.sh
COPY ./src/pwd /pwd
COPY ./src/telegraf.conf /etc/telegraf.conf
RUN chmod 777 /setup.sh
RUN echo -e "azerty\nazerty" | adduser test
RUN echo -e "azerty\nazerty" | adduser sudoer
RUN echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
RUN adduser sudoer wheel

ENTRYPOINT ["/setup.sh" ]