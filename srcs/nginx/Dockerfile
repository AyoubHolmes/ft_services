FROM alpine:3.12.3

RUN apk update
RUN apk add nginx
RUN apk add sudo
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN echo "<h1>Hello world!</h1>" > /www/index.html
COPY ./src/nginx.conf /etc/nginx/nginx.conf
RUN apk add openrc
RUN rc-update add nginx default
RUN apk add openssl 
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
RUN apk update
RUN apk add openssh
RUN rc-update add sshd default
RUN rm /etc/ssh/sshd_config
COPY ./src/ssh.conf /etc/ssh/sshd_config
COPY ./src/setup.sh /setup.sh
COPY ./src/pwd /pwd
RUN chmod 777 /setup.sh
RUN echo -e "azerty\nazerty" | adduser test
RUN echo -e "azerty\nazerty" | adduser sudoer
RUN echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
RUN adduser sudoer wheel
RUN openrc default

ENTRYPOINT ["/setup.sh" ]