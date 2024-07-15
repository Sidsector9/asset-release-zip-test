#!/bin/bash

wp-env run cli wp core multisite-convert
HTACCESS_PATH="$(wp-env install-path)/WordPress/.htaccess"
cp .htaccess $HTACCESS_PATH;
wp-env run cli wp user create second 'second@admin.local' --user_pass=password --role=administrator
wp-env run cli wp site create --slug=second --title='Second Site' --email='second@admin.local'
