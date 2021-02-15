# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :cronjob

# cronfile
property :file_name,       String, name_property: true
property :file_owner,      String, default: 'root'
property :file_group,      String, default: 'root'
property :file_mode,       String, default: '0644'
property :cron_dir,        String, default: '/etc/cron.d'

# job
property :command,         String, required: true
property :time,            String, required: true
property :user,            String, default: 'root'
property :comment,         String
property :path,            String, default: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

# package
property :package_name,    String, default: 'cron'
property :check_package,   [true, false], default: true

# service
property :service_name,    String, default: 'cron'
property :check_service,   [true, false], default: true

default_action :create

action :create do
  template "#{new_resource.cron_dir}/#{new_resource.file_name}" do
    source 'cronfile.erb'
    owner "#{new_resource.file_owner}"
    group "#{new_resource.file_group}"
    mode "#{new_resource.file_mode}"
    variables(
      command: new_resource.command,
      time:    new_resource.time,
      user:    new_resource.user,
      comment: new_resource.comment,
      path:    new_resource.path
    )
    action :create
  end

  if new_resource.check_package
    apt_package new_resource.package_name do
      action :install
    end
  end

  if new_resource.check_service
    service new_resource.service_name do
      action [:enable, :start]
    end
  end


end

action :delete do
  file "#{new_resource.cron_dir}/#{new_resource.file_name}" do
    action :delete
  end

end
