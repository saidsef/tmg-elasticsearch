#
# Cookbook Name:: tmg-elasticsearch
# Recipe:: default
#
# Author:: Said Sef <said.sef@telegraph.co.uk>
# Cookbook Name:: tmg-elasticsearch
# Recipe:: default.rb
#
# Copyright 2011, TMG

chef_gem "chef-rewind"
require 'chef/rewind'

include_recipe 'elasticsearch::default'
include_recipe 'elasticsearch::ebs'
include_recipe 'elasticsearch::data'
include_recipe 'elasticsearch::plugins'
include_recipe 'elasticsearch::aws'