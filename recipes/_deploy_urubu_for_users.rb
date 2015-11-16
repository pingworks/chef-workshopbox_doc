#
# Cookbook Name:: workshopbox_doc
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

Dir.foreach(node['workshopbox_doc']['secret_service']['client']['repo'] + '/user') do |username|
  next if username == '.' || username == '..'

  bash 'parse urubu tpl for user ' + username do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      [ ! -d /var/cache/urubu/#{username} ] && mkdir /var/cache/urubu/#{username}
      rsync -avx --delete --exclude=.git /var/cache/urubu/urubu-workshopbox_doc/ /var/cache/urubu/#{username}/
      USER_FIRSTNAME=$(< #{node['workshopbox_doc']['secret_service']['client']['repo']}/user/#{username}/firstname)
      USER_LASTNAME=$(< #{node['workshopbox_doc']['secret_service']['client']['repo']}/user/#{username}/lastname)
      USER_COMPANY=$(< #{node['workshopbox_doc']['secret_service']['client']['repo']}/user/#{username}/company)
      USER_EMAIL=$(< #{node['workshopbox_doc']['secret_service']['client']['repo']}/user/#{username}/email)
      sed -i "s/__user__/#{username}/g;s/__user_firstname__/$USER_FIRSTNAME/g;s/__user_lastname__/$USER_LASTNAME/g;s/__user_company__/$USER_COMPANY/g;s/__user_email__/$USER_EMAIL/g" /var/cache/urubu/#{username}/_site.yml
      sed -i "s/__user__/#{username}/g;s/__user_firstname__/$USER_FIRSTNAME/g;s/__user_lastname__/$USER_LASTNAME/g;s/__user_company__/$USER_COMPANY/g;s/__user_email__/$USER_EMAIL/g" /var/cache/urubu/#{username}/_layouts/footer.html
      cd /var/cache/urubu/#{username}
      make
      [ ! -d /usr/share/nginx/html/#{username} ] && mkdir /usr/share/nginx/html/#{username}
      rsync -avx --delete _build/ /usr/share/nginx/html/#{username}/
    EOH
  end



end
