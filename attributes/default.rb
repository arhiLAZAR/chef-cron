default['chef-cron']['package']['package_name'] = "cron"
default['chef-cron']['service']['service_name'] = "cron"


default['chef-cron']['cronfiles']['cron_dir'] = "/etc/cron.d"
default['chef-cron']['cronfiles']['jobs'] = {
  "run_echo" => {
    "command"      => "echo '1234' > /root/from_cron.txt",
    "minute"       => "*",
    "hour"         => "*",
    "monthday"     => "*",
    "month"        => "*",
    "weekday"      => "*",
    "run_user"     => "root",
    "comment"      => "Simple echo job",
    "path"         => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    "file_owner"   => "root",
    "file_group"   => "root",
    "mode"         => "0644",
  }
}
