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

case node['platform']
when "ubuntu","debian"
  include_recipe 'elasticsearch::deb'
when "centos","redhat","fedora"
   include_recipe 'elasticsearch::rpm'
end

include_recipe 'elasticsearch::default'

rewind :template => "elasticsearch.yml" do
  source "elasticsearch.yml.erb"
  cookbook_name "tmg-elasticsearch"
end

include_recipe 'elasticsearch::ebs'
include_recipe 'elasticsearch::data'
include_recipe 'elasticsearch::plugins'
include_recipe 'elasticsearch::aws'