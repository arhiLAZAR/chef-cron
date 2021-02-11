#
# Cookbook:: chef-cron
# Recipe:: service
#
# Copyright:: 2021, The Authors, All Rights Reserved.

service_name = node['chef-cron']['service']['service_name']

service service_name do
  action [:enable, :start]
end
