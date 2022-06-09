FROM debian:buster

RUN apt-get update
RUN apt-get install -y php php-fpm php-mysql php-gd php-mbstring php-xml php-xmlrpc php-intl php-zip php-curl php-zip php-json
RUN apt-get install -y openssl mariadb-client

RUN mkdir /run/php/

COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/startup.sh /startup.sh

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

CMD ["./startup.sh"]