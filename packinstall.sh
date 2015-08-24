#!/bin/bash

apt-get install -y git nginx percona-server-server-5.6 percona-server-client-5.6 percona-xtradb-cluster-56 qpress xtrabackup python-software-properties netcat \
php7.0 php7.0-fpm php7.0-common redis-server varnish=3.0.7-1~trusty hhvm 


#install composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

cd /var/www/chempros

#install n98-magerun
git clone https://github.com/netz98/n98-magerun
php ./composer.phar install
