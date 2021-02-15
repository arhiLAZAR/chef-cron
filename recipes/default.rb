#
# Cookbook:: chef-cron
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

chef_cron_cronjob 'test_name' do
  command "echo zzz > /root/cr.txt"
  time "* * * * *"
  # action :delete
end

chef_cron_cronjob 'test_name2' do
  command "echo zzzX > /root/cr2.txt"
  time "* * * * *"
  check_package false
  check_service false
end
