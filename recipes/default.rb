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

rewind :template => "elasticsearch.yml" do
  source "elasticsearch.yml.erb"
  cookbook_name "tmg-elasticsearch"
end

rewind :template => "/etc/init.d/elasticsearch" do
  source "elasticsearch.init.erb"
  cookbook_name "tmg-elasticsearch"
  owner 'root' and mode 0755
end

rewind :template => "elasticsearch-env.sh" do
  path   "#{node.elasticsearch[:path][:conf]}/elasticsearch-env.sh"
  source "tmg-elasticsearch-env.sh.erb"
  owner node.elasticsearch[:user] and group node.elasticsearch[:user] and mode 0755

  notifies :restart, 'service[elasticsearch]' unless node.elasticsearch[:skip_restart]
end

include_recipe 'elasticsearch::ebs'
include_recipe 'elasticsearch::data'
include_recipe 'elasticsearch::plugins'
include_recipe 'elasticsearch::aws'
