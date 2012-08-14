#
# Cookbook Name:: fast_start
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#template /tmp/deep_thought.txt" do
template "#{ENV['HOME']}/deep_thought.txt" do
	source "deep_thought.txt.erb"
	mode "0644"
	variables :deep_thought => node['deep_thought']
#	action :create
end
