# phocaseサーバ構築料理レシピ

include_recipe "cookbooks/security/default.rb"
include_recipe "cookbooks/yum/default.rb"
include_recipe "cookbooks/git/default.rb"
include_recipe "cookbooks/redis/default.rb"
include_recipe "cookbooks/memcached/default.rb"
include_recipe "cookbooks/nginx/default.rb"
include_recipe "cookbooks/php/default.rb"

case node[:env]
when "development" then
  include_recipe "cookbooks/mysql/default.rb"
  # include_recipe "cookbooks/postgresql/default.rb"

when "staging" then
  include_recipe "cookbooks/timezone/default.rb"

when "production" then
  include_recipe "cookbooks/timezone/default.rb"

end
