FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server
RUN apt-get install -y vim

COPY tools .

EXPOSE 3306

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["./startup.sh"]