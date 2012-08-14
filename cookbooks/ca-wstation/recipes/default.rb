#
# Cookbook Name:: fast_start
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#template /tmp/deep_thought.txt" do
#template "#{ENV['HOME']}/deep_thought.txt" do
#	source "deep_thought.txt.erb"
#	mode "0644"
#	variables :deep_thought => node['deep_thought']
#	action :create
#end

#%w{mc yum-utils}.each do |pkg|
#  package pkg
#end

#package "mc" do
#  action :install
#end

#package "yum-utils" do
#  action :install
#end

node[:needed_packages].each do |pkg|
  package pkg
end

execute "Install Dev Tools" do
  command "yum -y --setopt=group_package_types=mandatory groupinstall 'Development tools'"
  creates "/usr/bin/repoquery"
  action :run
end
