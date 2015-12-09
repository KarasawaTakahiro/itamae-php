package 'http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm' do
  not_if 'rpm -q epel-release'
end

package 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm' do
  not_if 'rpm -q remi-release'
end

remote_file "/etc/yum.repos.d/remi.repo" do
  owner "root"
  group "root"
  source "./templates/etc/yum.repos.d/remi.repo"
end
