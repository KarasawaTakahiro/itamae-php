execute "timezone" do
  user "root"
  command "cp /usr/share/zoneinfo/Japan /etc/localtime"
end

remote_file "/etc/sysconfig/clock" do
  owner "root"
  group "root"
  source "./templates/etc/sysconfig/clock"
end
