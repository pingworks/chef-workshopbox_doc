#
# Cookbook Name:: workshopbox_doc
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#
package 'nginx'

service 'nginx' do
  supports :status => :true, :restart => :true, :reload => :true
  action :nothing
end

template '/etc/nginx/sites-available/default' do
  source 'nginx_default.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :reload, 'service[nginx]', :immediately
end
