#
# Cookbook:: chef-cron
# Recipe:: package
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package_name = node['chef-cron']['package']['package_name']

apt_package package_name do
  action :install
end
