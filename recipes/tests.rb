#
# Cookbook:: chef-cron
# Recipe:: tests
#
# Copyright:: 2021, The Authors, All Rights Reserved.

chef_cron_cronjob 'test_job' do
  command 'echo "${FOO} - ${BAR}" > /tmp/test.txt'
  time '1 2 3 4 5'
  user 'tester'
  path '/bin:/var/lib/tester'
  environment 'FOO' => 'bar',
              'BAR' => 'com'
  mailto 'tester@example.com'
  comment "That's a testing job"
end
