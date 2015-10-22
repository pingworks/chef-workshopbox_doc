#
# Cookbook Name:: workshopbox_doc
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

package 'git'
package 'python-pip'

bash 'install urubu' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  pip install urubu
  EOH
end

directory '/var/cache/urubu' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

bash 'clone urubu-workshopbox_doc' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    cd /var/cache/urubu
    if [ ! -d urubu-workshopbox_doc ];then
      git clone #{node['workshopbox_doc']['urubu-workshopbox_doc']['giturl']} urubu-workshopbox_doc
    fi
    if [ ! "#{node['workshopbox_doc']['urubu-workshopbox_doc']['version']}" = "HEAD" ];then
      cd urubu-workshopbox_doc
      git checkout tags/v#{node['workshopbox_doc']['urubu-workshopbox_doc']['version']}
    fi
  EOH
  not_if { ::File.directory?('/var/cache/urubu/urubu-tpl') }
end
