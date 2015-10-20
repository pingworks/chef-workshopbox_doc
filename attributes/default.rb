# User Setup Prerequisit:
# a secret_service client repo (just a simple folderstructure) exists at:
default['workshopbox_doc']['secret_service']['client']['repo'] = '/var/lib/secret-service'
default['workshopbox_doc']['secret_service']['client']['user'] = 'root'

default['workshopbox_doc']['domain'] = 'ws.net'

default['workshopbox_doc']['adminuser']['username'] = 'vagrant'

default['workshopbox_doc']['urubu-tpl']['giturl'] = 'https://github.com/pingworks/urubu-tpl.git'
default['workshopbox_doc']['urubu-tpl']['version'] = '0.1.0'

# needed for custom ohai plugins
default['ohai']['plugins']['workshopbox_doc'] = 'plugins'
