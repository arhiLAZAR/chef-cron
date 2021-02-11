#
# Cookbook:: chef-cron
# Recipe:: cronfiles
#
# Copyright:: 2021, The Authors, All Rights Reserved.

jobs  = node['chef-cron']['cronfiles']['jobs']
cron_dir = node['chef-cron']['cronfiles']['cron_dir']

jobs.each do |filename, params|
  template "#{cron_dir}/#{filename}" do
    source 'cronfile.erb'
    owner "#{params['file_owner']}"
    group "#{params['file_group']}"
    mode "#{params['mode']}"
    variables(
      params: params
    )
    action :create
  end
end
