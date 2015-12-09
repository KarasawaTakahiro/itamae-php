%w(postgresql postgresql-server postgresql-libs).each do |pkg|
  package pkg
end

service 'postgresql' do
  action [:enable, :start]
end