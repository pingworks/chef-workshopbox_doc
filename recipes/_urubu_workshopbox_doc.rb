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
    cd urubu-workshopbox_doc
    if [ "#{node['workshopbox_doc']['urubu-workshopbox_doc']['version']}" = "HEAD" ];then
      git pull origin master
    else
      git fetch origin master
      git checkout tags/v#{node['workshopbox_doc']['urubu-workshopbox_doc']['version']}
    fi
  EOH
end

bash 'substitute version number' do
  user 'root'
  cwd '/var/cache/urubu/urubu-workshopbox_doc'
  code <<-EOH
  VERSION="#{node['workshopbox_doc']['urubu-workshopbox_doc']['build_number']}+git$(git ref-parse --short HEAD)"
  sed -i "s;__VERSION__;${VERSION};g" _layouts/footer.html
  EOH
end
