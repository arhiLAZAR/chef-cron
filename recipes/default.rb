#
# Cookbook:: chef-cron
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe '::package'
include_recipe '::service'
include_recipe '::cronfiles'
