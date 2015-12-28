package "nginx" do
  action :install
end

template "/etc/nginx/nginx.conf" do
  owner "root"
  group "root"
  mode "644"
  source "./templates/etc/nginx/nginx.conf.erb"
end

template "/etc/nginx/conf.d/virtual.conf" do
  owner "root"
  group "root"
  mode "644"
  source "./templates/etc/nginx/conf.d/virtual.conf.erb"
end

template "/etc/logrotate.d/nginx" do
  source "./templates/etc/logrotate.d/nginx.erb"
end

if node[:nginx][:useBasicAuth] then
  remote_file "/etc/nginx/conf.d/.htpasswd" do
    owner "nginx"
    group "nginx"
    source "./templates/etc/nginx/conf.d/htpasswd"
  end
end

service 'nginx' do
  action [:enable, :start]
end
