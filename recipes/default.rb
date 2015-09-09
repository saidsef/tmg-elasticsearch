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

include_recipe 'java'
include_recipe 'logrotate'

case node['platform_family']
when 'rhel'
  include_recipe 'yum'

  yum_repository 'elasticsearch' do
    action :remove
  end

  yum_repository 'logstash' do
    description "Logstash repository for #{node['elasticsearch']['version']}.x packages"
    baseurl "http://packages.elasticsearch.org/elasticsearch/#{node['elasticsearch']['version']}/centos"
    gpgkey "http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
    action :create
  end
when 'debian'
  include_recipe 'apt'

  apt_repository 'elasticsearch' do
    action :remove
  end

  apt_repository "logstash" do
    uri "http://packages.elasticsearch.org/elasticsearch/#{node['elasticsearch']['version']}/debian"
    components ["stable", "main"]
    key "http://packages.elasticsearch.org/GPG-KEY-elasticsearch"
    action :add
  end
end

%w{elasticsearch nmap}.each do |pkg|
  package pkg do
    action :install
  end
end

logrotate_app "elasticsearch" do
  cookbook   'logrotate'
  path       ['/var/log/elsticsearch/#{node['elasticsearch']['cluster.name']}.log']
  frequency  'daily'
  size       '50M'
  options    ['missingok', 'delaycompress', 'notifempty']
  rotate     1
end
