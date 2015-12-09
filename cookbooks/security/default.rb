service 'iptables' do
  action [:disable, :stop]
end

include_recipe 'selinux::disabled'

if node[:env] != "development" then
  template "/etc/sudoers" do
    source "./templates/etc/sudoers.erb"
    mode   "440"
    owner  "root"
    group  "root"
  end
end
