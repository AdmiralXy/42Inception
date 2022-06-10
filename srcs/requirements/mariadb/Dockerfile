FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./tools/startup.sh .

HEALTHCHECK --start-period=5m \
  CMD mariadb -u root -p${DB_ROOT_PASSWORD} -e 'SELECT @@datadir;' || exit 1

CMD ["./startup.sh"]