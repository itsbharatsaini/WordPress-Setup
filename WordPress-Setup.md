1. Updates the package index files
sudo apt-get update

2. Install Apache server on Ubuntu
sudo apt install apache2

3. Install php runtime and php mysql connector
sudo apt install php libapache2-mod-php php-mysql

4. Install MySQL server
sudo apt install mysql-server 

5. Login to MySQL server
sudo mysql -u root

6. Change authentication plugin to mysql_native_password (change the password to something strong)
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'Testpassword@123';

7. Create a new database user for wordpress (change the password to something strong)
CREATE USER 'wp_user'@localhost IDENTIFIED BY 'Testpassword@123';

8. Create a database for wordpress
CREATE DATABASE wp;

9. Grant all privilges on the database 'wp' to the newly created user
GRANT ALL PRIVILEGES ON wp.* TO 'wp_user'@localhost;

10. Download wordpress
cd /tmp
wget https://wordpress.org/latest.tar.gz

11. Unzip
tar -xvf latest.tar.gz

12. Move wordpress folder to apache document root
sudo mv wordpress/ /var/www/html

13. Command to restart/reload apache server
sudo systemctl restart apache2
OR
sudo systemctl reload apache2

14. Install certbot
sudo apt-get update
sudo apt install certbot python3-certbot-apache

15. Request and install ssl on your site with certbot
sudo certbot --apache
