FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx wget

COPY ./tools/nginx.conf /etc/nginx/sites-available/default

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/kricky.42.fr.key \
        -out /etc/ssl/certs/kricky.42.fr.crt -subj \
        "/C=US/CN=AdmiralXy"

CMD ["nginx", "-g", "daemon off;"]
