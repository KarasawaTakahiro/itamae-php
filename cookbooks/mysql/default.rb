%w( mysql mysql-server ).each do |pkg|
  package pkg
end

service 'mysqld' do
  action [:enable, :start]
end