%w(
php
php-mbstring
php-xml
php-gd
php-fpm
php-mysql
php-pgsql
php-opcache
php-mcrypt
php-pear
php-pear-Cache-Lite
php-pecl-redis
php-pecl-memcached
php-pecl-memcache ).each do |pkg|
  package pkg do
    options "--enablerepo=remi-php56"
  end
end

service 'php-fpm' do
  action [:enable, :start]
end

template "/etc/php-fpm.d/www.conf" do
  source "./templates/etc/php-fpm.d/www.conf.erb"
end

template "/etc/php.ini" do
  source "./templates/etc/php.ini.erb"
end

template "/etc/logrotate.d/php-fpm" do
  source "./templates/etc/logrotate.d/php-fpm.erb"
end

template "/etc/php.d/10-opcache.ini" do
  source "./templates/etc/php.d/10-opcache.ini.erb"
end
