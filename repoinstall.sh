#!/bin/bash

# use nginx=stable for latest development version
add-apt-repository ppa:nginx/development

# install percona repo
apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
cat >> /etc/apt/sources.list.d/percona.list <<END
deb http://repo.percona.com/apt vivid main
deb-src http://repo.percona.com/apt vivid main
END

# install hhvm repo
apt-get install software-properties-common \
&& apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 \
&& add-apt-repository 'deb http://dl.hhvm.com/ubuntu vivid main'

# install PHP7 repo
add-apt-repository ppa:ondrej/php-7.0

#install Varnish repo
apt-get install apt-transport-https
curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-3.0" >> /etc/apt/sources.list.d/varnish-cache.list

# install redis repo
add-apt-repository ppa:chris-lea/redis-server

#install new relic repo
echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | sudo tee /etc/apt/sources.list.d/newrelic.list
wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -

#install odoo repo
wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
echo "deb http://nightly.odoo.com/8.0/nightly/deb/ ./" >> /etc/apt/sources.list

apt-get update 
