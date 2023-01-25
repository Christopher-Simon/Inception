FROM debian:buster

# RUN mysql_secure_installation
COPY ./conf/setup_mariadb.sh /
RUN apt update && apt install -y mariadb-server htop && \
 sh setup_mariadb.sh
RUN mkdir /app && touch /app/zizi

EXPOSE 3306

CMD ["mysqld"]
