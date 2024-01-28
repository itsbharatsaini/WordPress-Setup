# !/bin/bash

sudo apt-get update
echo "Updates the package index files - [Done]"

sudo apt install apache2 -y
echo "Install Apache - [Done]"

sudo apt install php libapache2-mod-php php-mysql -y
echo "Install php runtime and php mysql connector - [Done]"


sudo apt install mysql-server 
echo "Installing MySQL server..."
read -s -p "Enter MySQL Root Password: " ROOT_PASSWORD
echo
read -p "Enter Database Name : " DB_NAME
echo
read -p "Enter Database Username : " DB_USER
echo
read -s -p "Enter DB Password : " DB_PASSWORD
echo

MySQL_Command="mysql -u root -p$ROOT_PASSWORD -e"
$MySQL_Command "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$ROOT_PASSWORD';"

$MySQL_Command "CREATE USER '$DB_USER'@localhost IDENTIFIED BY '$DB_PASSWORD';"
$MySQL_Command "CREATE DATABASE $DB_NAME;"
$MySQL_Command "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@localhost;"

echo "Installing MySQL server - [Done]"
echo "MySQL root password has been set - [Done]"
echo "Database Created - [Done]"

echo "Installing WordPress..."
cd /tmp
wget https://wordpress.org/latest.tar.gz    
tar -xvf latest.tar.gz
sudo mv wordpress/ /var/www/html

export $DB_NAME
export $DB_USER
export $DB_PASSWORD

export AuthKeys=$(curl -s 'https://api.wordpress.org/secret-key/1.1/salt/')
export TablePrefix='$table_prefix'

# Create wp-config.php using a here document
cat << EOF > /var/www/html/wordpress/wp-config.php
<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', "$DB_NAME" );

/** Database username */
define( 'DB_USER', "$DB_USER" );

/** Database password */
define( 'DB_PASSWORD', "$DB_PASSWORD" );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
$AuthKeys

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$TablePrefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

EOF

sudo systemctl restart apache2