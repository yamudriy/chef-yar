#
# Cookbook Name:: timezone
# Recipe:: default
#
# Copyright 2010, James Harton <james@sociable.co.nz>
#
# Apache 2.0 License.
#


if ['debian','ubuntu'].member? node[:platform]
  # Make sure it's installed. It would be a pretty broken system
  # that didn't have it.
  package "tzdata"

  template "/etc/timezone" do
    source "timezone.conf.erb"
    owner 'root'
    group 'root'
    mode 0644
    notifies :run, 'bash[dpkg-reconfigure tzdata]'
  end

  bash 'dpkg-reconfigure tzdata' do
    user 'root'
    code "/usr/sbin/dpkg-reconfigure -f noninteractive tzdata"
    action :nothing
  end

if ['centos','redhat','scientific','fedora'].member? node[:platform]
  # Make sure it's installed. It would be a pretty broken system
  # that didn't have it.
  package "tzdata"

  execute "hwclock-sync" do
    command "cp -f /usr/share/zoneinfo/#{node[:tz]} /etc/localtime"
    # Hardware clock synchronization doesn't work on virtual machines ?
    #command "hwclock --systohc > /dev/null 2>&1"
    action :nothing
  end

  template "/etc/sysconfig/clock" do
    source "clock.erb"
    owner 'root'
    group 'root'
    mode 0644
    notifies :run, resources(:execute => "hwclock-sync")
  end


end
