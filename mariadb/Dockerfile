FROM debian:buster

RUN apt update && apt install -y mariadb-server

RUN mysql_secure_installation
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

RUN mysql -uroot -p -e "SET PASSWORD FOR 'root'@'%' = PASSWORD('qwerty');"
RUN mysql -uroot -pqwerty -e "FLUSH PRIVILEGES;"
RUN mysql -uroot -pqwerty -e "CREATE DATABASE wordpress;"
RUN mysql -uroot -pqwerty -e "GRANT ALL ON wordpress.* TO 'chsimon'@'%' IDENTIFIED BY 'qwerty';"
RUN mysql -uroot -pqwerty -e "FLUSH PRIVILEGES;"
#sert a "reboot" en gros
