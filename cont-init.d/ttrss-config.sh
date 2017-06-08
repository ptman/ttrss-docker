#!/usr/bin/with-contenv sh

if [ ! -e /opt/ttrss/config.php ];  then
    cat > /opt/ttrss/config.php <<EOF
<?php
// See config.php-dist for an example config file
define('DB_TYPE', 'pgsql');
define('DB_HOST', '${DB_HOST}');
define('DB_NAME', '${DB_NAME}');
define('DB_USER', '${DB_USER}');
define('DB_PASS', '${DB_PASS}');
define('DB_PORT', '${DB_PORT}');
define('MYSQL_CHARSET', 'UTF8');
define('SELF_URL_PATH', '${BASE_URL}');
define('FEED_CRYPT_KEY', '${FEED_CRYPT_KEY}');
define('SINGLE_USER_MODE', false);
define('SIMPLE_UPDATE_MODE', false);
define('PHP_EXECUTABLE', '/usr/bin/php5');
define('LOCK_DIRECTORY', 'lock');
define('CACHE_DIR', 'cache');
define('ICONS_DIR', 'feed-icons');
define('ICONS_URL', 'feed-icons');
define('AUTH_AUTO_CREATE', true);
define('AUTH_AUTO_LOGIN', true);
define('FORCE_ARTICLE_PURGE', 0);
define('PUBSUBHUBBUB_HUB', '');
define('PUBSUBHUBBUB_ENABLED', false);
define('SPHINX_SERVER', 'localhost:9312');
define('SPHINX_INDEX', 'ttrss, delta');
define('ENABLE_REGISTRATION', false);
define('REG_NOTIFY_ADDRESS', '${MAIL_REGISTRATIONS}');
define('REG_MAX_USERS', 1);
define('SESSION_COOKIE_LIFETIME', 86400);
define('SMTP_FROM_NAME', '${MAIL_SENDER}');
define('SMTP_FROM_ADDRESS', '${MAIL_FROM}');
define('DIGEST_SUBJECT', '[tt-rss] New news for the past 24h');
define('SMTP_SERVER', '${MAIL_HOST}');
define('SMTP_LOGIN', '${MAIL_USER}');
define('SMTP_PASSWORD', '${MAIL_PASS}');
define('SMTP_SECURE', '${MAIL_SECURE}');
define('CHECK_FOR_UPDATES', true);
define('ENABLE_GZIP_OUTPUT', false);
define('PLUGINS', 'auth_internal, note');
define('LOG_DESTINATION', 'sql');
define('CONFIG_VERSION', 26);
?>
EOF
fi
