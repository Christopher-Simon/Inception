#!/bin/sh
#https://zetcode.com/mysql/firststeps/#:~:text=We%20check%20the%20status%20with%20the%20systemctl%20status%20mysql%20command.&text=We%20use%20the%20mysqladmin%20tool,a%20password%20for%20the%20user.
#Check if mysqld is on

MYSQL_ADMIN_VAR="mysqladmin -u root ping"

echo $MYSQL_ADMIN_VAR
mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
mysqld &
while true
do
    $MYSQL_ADMIN_VAR
    if [ $? -eq 0 ]; then
        echo "mysqladmin is responding"
        break
    else 
        echo "mysqladmin is not responding, retrying..."
        sleep 5    
    fi
done
mysql -uroot -e "CREATE DATABASE wordpress;"
echo "Created Database wp"
mysql -uroot -e "GRANT ALL ON wordpress.* TO 'chsimon'@'%' IDENTIFIED BY 'qwerty';"
mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('qwerty');"
echo "Set pass for root"
mysql -uroot -e "FLUSH PRIVILEGES;"
echo "Done"
