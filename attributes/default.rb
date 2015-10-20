# User Setup Prerequisit:
# a secret_service client repo (just a simple folderstructure) exists at:
default['workshopbox_doc']['secret_service']['client']['repo'] = '/var/lib/secret-service'
default['workshopbox_doc']['secret_service']['client']['user'] = 'root'

default['workshopbox_doc']['domain'] = 'ws.net'

default['workshopbox_doc']['adminuser']['username'] = 'vagrant'

# needed for custom ohai plugins
default['ohai']['plugins']['workshopbox_doc'] = 'plugins'
