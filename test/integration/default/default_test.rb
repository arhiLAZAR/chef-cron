# InSpec test for recipe chef_cron::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe package('cron') do
  it { should be_installed }
end

describe service('cron') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/cron.d/test_job') do
  its('content') { should match('^############################################################$') }
  its('content') { should match('^# This file is managed by Chef, and is refreshed regularly #$') }
  its('content') { should match('^#                       DO NOT EDIT!                       #$') }
  its('content') { should match('^############################################################$') }
  its('content') { should match('^## That\'s a testing job$') }
  its('content') { should match('^MAILTO=tester@example.com$') }
  its('content') { should match('^# Environment Settings$') }
  its('content') { should match('^PATH=/bin:/var/lib/tester$') }
  its('content') { should match('^FOO=bar$') }
  its('content') { should match('^BAR=com$') }
  its('content') { should match('^# Job Definition$') }
  its('content') { should match('^1 2 3 4 5   tester  echo "\${FOO} - \${BAR}" > /tmp/test.txt$') }
end
