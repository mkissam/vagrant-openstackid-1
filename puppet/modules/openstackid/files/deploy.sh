#!/bin/bash
cd /srv/openstackid
rm -rf public
git init
git remote add origin https://github.com/openstack-infra/openstackid.git
git fetch
git checkout -t origin/master
ln -sf /etc/openstackid/environment.php ./bootstrap/environment.php
ln -sf /etc/openstackid/recaptcha.php ./app/config/packages/greggilbert/recaptcha/dev/config.php
ln -sf /etc/openstackid/database.php ./app/config/dev/database.php
ln -sf /etc/openstackid/log.php ./app/config/dev/log.php
ln -sf /etc/openstackid/server.php ./app/config/dev/server.php
chgrp -R www-data .
chmod 0775 app/storage/cache app/storage/logs app/storage/meta app/storage/sessions app/storage/views
curl -sS https://getcomposer.org/installer | php
php composer.phar install
php artisan migrate --env=dev
php artisan db:seed --env=dev
mysql os_members < /vagrant/puppet/modules/openstackid/files/os_members.sql
touch /srv/openstackid/deploy.lock