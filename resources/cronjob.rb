# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :chef_cron_job

# cronfile
property :name,          String, default: 'chef_crontab'
property :file_owner,    String, default: 'root'
property :file_group,    String, default: 'root'
property :file_mode,     String, default: '0644'
property :cron_dir,      String, default: '/etc/cron.d'

# job
property :jobs,          Hash
property :default_user,  String, default: 'root'
property :mailto,        String
property :path,          String, default: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
property :environment,   Hash

default_action :create

action :create do
  template "#{new_resource.cron_dir}/#{new_resource.name}" do
    source  'cronfile.erb'
    owner   new_resource.file_owner
    group   new_resource.file_group
    mode    new_resource.file_mode
    variables(
      jobs:          new_resource.jobs,
      default_user:  new_resource.default_user,
      mailto:        new_resource.mailto,
      path:          new_resource.path,
      environment:   new_resource.environment
    )
    action  :create
  end
end

action :delete do
  file "#{new_resource.cron_dir}/#{new_resource.file_name}" do
    action :delete
  end
end
