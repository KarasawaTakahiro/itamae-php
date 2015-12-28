package "memcached" do
  action :install
end

# 開発環境以外は外部のmemcachedサーバを使用するため起動しない
if node[:env] != "production" then
  service 'memcached' do
    action [:enable, :start]
  end
end