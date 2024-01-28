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
define( 'DB_NAME', '' );

/** Database username */
define( 'DB_USER', '' );

/** Database password */
define( 'DB_PASSWORD', '' );

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
define( 'AUTH_KEY',         'V^GE6%lnJjjn7F?~(@ ,|{s`1^K%SLA*0u0/C0}!)&QK3sOIN&Y=;GLF@9Nio;Uk' );
define( 'SECURE_AUTH_KEY',  ',[,*iHQ4^s$T]wE|I#pA>?`>5^[3T[), 1wWWF66t05Q@dB{5tb[E4J^2L7Sr.Ml' );
define( 'LOGGED_IN_KEY',    '>z?bF-u;: 2y 8fto-<y15LjD!FhCsV`h_?X~hYnRJbC**.%P2e!?&IBZ/z6jg-G' );
define( 'NONCE_KEY',        'z]8Jd2ENX@i/p!*@bSK2 @;A{%N6%&dG1JTet?FA`}nCqD{3U$6bICj{J]NRl/]s' );
define( 'AUTH_SALT',        '3<cT8]x/Vs:s1*X4/o{|$O #+~;cQ5HgR6gRPO]bU^#[3;bUO!t`V[cL1k[MIV:?' );
define( 'SECURE_AUTH_SALT', '0Uj*+mie^h-q)>Zq4J>k]FM0sc+{Pl;BeAxw2[tW%Pxc%I.)_=gvCBD7Z-vvv0?j' );
define( 'LOGGED_IN_SALT',   'xZ6sxPw}bd8EUL>Q>cN9R>D`^%>1]W=F)}.b;a)=]b:VX3?(/dXkq6d_a?]N4$H%' );
define( 'NONCE_SALT',       ' ^B5iF;Fc)/o;JMD~x+&wxjuF/<o{B_LD}%.!,?gRJ~;BhLp&YeSp^{wfe,*[p5g' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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