#
# Cookbook Name:: workshopbox_doc
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

directory node['workshopbox_doc']['build']['target'] do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

bash 'pack' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  cd /usr/share/nginx
  tar cvfz #{node['workshopbox_doc']['build']['target']}/workshopbox_doc.tar.gz html
  EOH
end
