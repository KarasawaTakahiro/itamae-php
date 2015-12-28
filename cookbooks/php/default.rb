# package "php*" do
#   action :remove
# end

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
    case node[:php][:version]
      when "5.6"
        options "--enablerepo=remi-php56"
      when "5.5"
        options "--enablerepo=remi-php55"
    end
  end
end

if node[:httpd] == "nginx"
  service 'php-fpm' do
    action [:enable, :start]
  end
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
