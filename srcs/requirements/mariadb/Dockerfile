FROM debian:buster

# RUN mysql_secure_installation
COPY ./conf/setup_mariadb.sh /
RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client htop

COPY	./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sh setup_mariadb.sh

EXPOSE 3306

CMD ["sh", "/setup_mariadb.sh"]
