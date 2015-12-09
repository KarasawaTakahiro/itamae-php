package "redis" do
  action :install
end

# 開発環境以外は外部のRedisサーバを使用するため起動しない
if node[:env] != "production" then
  service 'redis' do
    action [:enable, :start]
  end
end
