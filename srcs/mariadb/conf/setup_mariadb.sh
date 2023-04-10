#!/bin/sh
#https://zetcode.com/mysql/firststeps/#:~:text=We%20check%20the%20status%20with%20the%20systemctl%20status%20mysql%20command.&text=We%20use%20the%20mysqladmin%20tool,a%20password%20for%20the%20user.
#Check if mysqld is on

mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
mysqld &
while true
do
    mysqladmin -u root ping
    if [ $? -eq 0 ]; then
        echo "mysqladmin is responding"
        break
    else 
        echo "mysqladmin is not responding, retrying..."
        sleep 5    
    fi
done
mysql -uroot -e "CREATE DATABASE $DB_DATABASE;"
echo "Created Database $DB_DATABASE"
mysql -uroot -e "GRANT ALL ON $DB_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD');"
echo "Set pass for root"
mysql -uroot -e "FLUSH PRIVILEGES;"
echo "Done"


mysqladmin -uroot -p$DB_ROOT_PASSWORD shutdown

exec mysqld
