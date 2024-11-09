<?php

define( 'DB_NAME', getenv( 'MDB_NAME' ) );
define( 'DB_USER', getenv( 'MDB_USER' ) );
define( 'DB_PASSWORD', getenv( 'MDB_USER_PWD' ) );
define( 'DB_HOST', getenv('WP_MDB_HOST') . ':' . getenv('MDB_PORT')); 
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', 'utf8_bin' );

define('WP_SITEURL', 'https://' . getenv('DOMAIN_NAME'));
define('WP_HOME', 'https://' . getenv('DOMAIN_NAME'));

define('AUTH_KEY',         '');
define('SECURE_AUTH_KEY',  '');
define('LOGGED_IN_KEY',    '');
define('NONCE_KEY',        '');
define('AUTH_SALT',        '');
define('SECURE_AUTH_SALT', '');
define('LOGGED_IN_SALT',   '');
define('NONCE_SALT',       '');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';