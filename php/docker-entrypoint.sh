#!/bin/bash

# working directory
cd /

# git clone
rm -rf /data/app \
        && mkdir -p /data/app \
        && git clone $GIT_REPO --branch ${GIT_BRANCH:-"master"} /data/app \
        && chown -R www-data:www-data /data/app

# document root
sed -e "s|^DocumentRoot .*|DocumentRoot \"/data/app$DOC_ROOT\"|g" \
        -i /etc/apache2/apache2.conf

# start apache
exec apache2-foreground