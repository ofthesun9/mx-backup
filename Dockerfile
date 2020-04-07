FROM alpine:3.11

RUN apk add --no-cache \
    postfix ca-certificates certbot bash

COPY main.cf /etc/postfix/main.cf
COPY startup.sh /startup.sh
COPY run_certbot.sh /run_certbot.sh

EXPOSE 25/tcp 80/tcp

VOLUME /config

RUN /usr/libexec/postfix/post-install meta_directory=/etc/postfix create-missing

CMD /startup.sh 
