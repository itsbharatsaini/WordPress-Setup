sudo apt-get install vsftpd
service apache2 restart
service vsftpd restart
sudo apt-get install zip
chmod -R 777 /var/www/my-project
chown -R erudi:www-data /var/www/my-project
cd /etc/apache2/sites-available
sudo apt-get update

