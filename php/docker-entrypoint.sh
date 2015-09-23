#!/bin/bash

# git clone
git clone ${GIT_REPO} /var/www/html \
        && chown -R www-data:www-data /var/www/html

# start apache
exec apache2-foreground