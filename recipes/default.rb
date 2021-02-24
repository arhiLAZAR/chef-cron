#
# Cookbook:: chef_cron
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package_name = node['chef_cron']['package_name']
service_name = node['chef_cron']['service_name']

apt_package package_name do
  action :install
end

service service_name do
  action [:enable, :start]
end

chef_cron_job do
  jobs         node['chef_cron']['jobs']
  mailto       node['chef_cron']['mailto']
  path         node['chef_cron']['path']
  environment  node['chef_cron']['environment']
end
