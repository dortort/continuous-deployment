#!/bin/bash

# git clone
git clone $GIT_REPO --branch ${GIT_BRANCH:-"master"} /var/www/html \
        && chown -R www-data:www-data /var/www/html

# document root
sed -e "s|^DocumentRoot .*|DocumentRoot \"/var/www/html$DOC_ROOT\"|g" \
        -i /etc/apache2/apache2.conf

# start apache
exec apache2-foreground