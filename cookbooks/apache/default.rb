%w( httpd mod_ssl ).each do |pkg|
  package pkg
end

template "/etc/httpd/conf.d/virtual.conf" do
  owner "root"
  group "root"
  mode "644"
  source "./templates/etc/httpd/conf.d/virtual.conf.erb"
end

template "/etc/logrotate.d/httpd" do
  source "./templates/etc/logrotate.d/httpd.erb"
end

if node[:apache][:useBasicAuth] then
  remote_file "/etc/httpd/conf.d/.htpasswd" do
    owner "apache"
    group "apache"
    source "./templates/etc/httpd/conf.d/htpasswd"
  end
end

directory "#{node[:apache][:ssl_key_dir]}"
remote_directory "./files/etc/httpd/ssl" do
  action :create
  path "#{node[:apache][:ssl_key_dir]}"
  source "./files/etc/httpd/ssl"
  mode "600"
  owner "root"
  group "root"
end


service 'httpd' do
  action [:enable, :start]
end
