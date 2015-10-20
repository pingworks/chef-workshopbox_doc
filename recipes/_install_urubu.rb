#
# Cookbook Name:: workshopbox_doc
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

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

bash 'clone urubu-tpl' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    cd /var/cache/urubu
    git clone #{node['workshopbox_doc']['urubu-tpl']['giturl']}
    git checkout tags/v#{node['workshopbox_doc']['urubu-tpl']['version']}
  EOH
  not_if File.directory?('/var/cache/urubu/urubu-tpl')
end
