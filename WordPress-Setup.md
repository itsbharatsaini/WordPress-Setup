#### WordPress Setup for Linux
1. Updates the package index files
```sh
sudo apt-get update
```

2. Install Apache server on Ubuntu
```sh
sudo apt install apache2
```

3. Install php runtime and php mysql connector
```sh
sudo apt install php libapache2-mod-php php-mysql
```
4. Install MySQL server
```sh
sudo apt install mysql-server 
```
5. Login to MySQL server
```sh
sudo mysql -u root
```
6. Change authentication plugin to mysql_native_password.
> Note: Change strong `ROOT_PASSWORD` password.
```sh
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'ROOT_PASSWORD';
```
7. Create a new database user for wordpress (change the password to something strong)
> Note: Change `DB_USER` and `DB_PASSWORD`.
```sh
CREATE USER 'DB_USER'@localhost IDENTIFIED BY 'DB_PASSWORD'
```

8. Create a database for wordpress
> Note: Change `DB_NAME`.
```sh
CREATE DATABASE DB_NAME;
```

9. Grant all privilges on the database 'wp' to the newly created user
> Note: Change `DB_NAME` and `DB_USER`.
```sh
GRANT ALL PRIVILEGES ON DB_NAME.* TO 'DB_USER'@localhost;
```
10. Download wordpress
```sh
cd /tmp
wget https://wordpress.org/latest.tar.gz
```

11. Unzip
```sh
tar -xvf latest.tar.gz
```
12. Move wordpress folder to apache document root
```sh
sudo mv wordpress/ /var/www/html
```
13. Command to restart/reload apache server
```sh
sudo systemctl restart apache2
```
OR
```sh
sudo systemctl reload apache2
```

14. Update root path URL ( Optional : If you want to update wordpress root URL )

```sh
sudo nano /etc/apache2/sites-available/000-default.conf
```
> Note : Replace `DocumentRoot /var/www/html` with `DocumentRoot /var/www/html/wordpress`.

15. Add Domain to server 
>Note : Replace <domain.com> with your domain and Add these lines to 000-default.conf.
```sh
ServerName domain.com
ServerAlias www.domain.com
```

```sh
sudo systemctl restart apache2
```

Also Update in WP_Website
> http://<domain.com>/wp-admin/options-general.php

```sh
WordPress Address (URL) : http://<domain.com>
Site Address (URL) : http://<domain.com>
```
16. Install certbot
```sh
sudo apt-get update
sudo apt install certbot python3-certbot-apache
```
17. Request and install ssl on your site with certbot
```sh
sudo certbot --apache
```