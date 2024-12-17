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
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'Inception' );

/** Database username */
define( 'DB_USER', 'zfavere' );

/** Database password */
define( 'DB_PASSWORD', 'blob' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define( 'AUTH_KEY',          'BZvUv/*LP{5XQ0obi^q#w8=:dS;|D0,%*ZDq%QIh?KKx0h_,tSDW|{p]$5e`%,:j' );
define( 'SECURE_AUTH_KEY',   '|K:#Fi?Wp5.z:)u;]v([<$C`>1yl]VP :k]XTz/&ZPoj t@IC!+hC(KmM=BzaT+L' );
define( 'LOGGED_IN_KEY',     '*zCwKHAFF5HP`3e_$6nTdS:X9~OExK[[[F+}DO70xU[X~yl9WPW1h=&ejEPhjhh@' );
define( 'NONCE_KEY',         'EA]j`6[Eu(.LwT4^s!%W9cxN4X@l!%HPHK7W$Q< S~h9@v]A&k31h?%avH1,i=QY' );
define( 'AUTH_SALT',         'N3 $ADo?}^Xfv9SR:5fMjh_wE^^[Gbv!EG4TeuU-0N~Fv8PFc_1GLxh*y+6udUIZ' );
define( 'SECURE_AUTH_SALT',  'NpjPlsz6$9w;giry|4AOt$.ixb_>]$HwEAMuSX<4-1rjx_zmwAXF:|e-g_t*>=3u' );
define( 'LOGGED_IN_SALT',    'J}4*Z6SXPp>h-%^EIc#+KXl:~#ht(d_b?}2YuKetWfjHFkT/B$kQo||,b4f1K&S|' );
define( 'NONCE_SALT',        'AXaBKGAsvRB+jqP7ucA/Yid-;^<LTI2>w3cY[Ps&pgt1*-pNx3xIndf.$kbB|9o~' );
define( 'WP_CACHE_KEY_SALT', 'DG_D^mlaQA|)6}~_eclx!x2,r&RU!PGs2Jmnd}gRbOY%8naX X*ID{0t=:K*FOC]' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
