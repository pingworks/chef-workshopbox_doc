#
# Cookbook Name:: workshopbox_doc
# Recipe:: default
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

include_recipe 'ohai'
include_recipe 'apt'
include_recipe 'workshopbox_doc::_nginx'
include_recipe 'workshopbox_doc::_urubu_workshopbox_doc'
include_recipe 'workshopbox_doc::_deploy_urubu_for_users'
