# chef_cron
Manages cronjobs located in /etc/cron.d/chef_crontab

## Usage
- Add cookbook "chef_cron" to the runlist
- Add attributes (see below)

## Attributes
Simple job:
```ruby
default['chef_cron']['jobs']['echo_job_name']['command'] = 'echo some_text'
default['chef_cron']['jobs']['echo_job_name']['time'] = '* * * * *'
```
Fields "**time**" and "**command**" are obligatory!


You can also specify "**user**" and "**comment**" for every job:
```ruby
default['chef_cron']['jobs']['env_job_name']['command'] = 'echo "${VAR} is ${FOO}" > /tmp/test.txt'
default['chef_cron']['jobs']['env_job_name']['time'] = '1 2 3 4 5'
default['chef_cron']['jobs']['env_job_name']['user'] = 'tester'
default['chef_cron']['jobs']['env_job_name']['comment'] = 'Testing task'
```

Additionally "**mailto**", "**path**" and "**environment**" may be specified (only once for all jobs):
```ruby
default['chef_cron']['mailto'] = 'tester@example.com'
default['chef_cron']['path'] = '/opt/python/bin'
default['chef_cron']['environment']['VAR'] = 'value'
default['chef_cron']['environment']['FOO'] = 'bar'
```
"**environment**" must be a hash.

## Tests
Just run:
```bash
kitchen test
```
