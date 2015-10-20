#
# Cookbook Name:: workshopbox_doc
# Recipe:: default
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

include_recipe 'ohai'

include_recipe 'workshopbox_doc::_install_nginx'
include_recipe 'workshopbox_doc::_install_urubu'
