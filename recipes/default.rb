#
# Cookbook Name:: shep5465
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Run apt now since it is needed in
# both apache and packages
include_recipe 'apt'
include_recipe 'shep5465::packages'
include_recipe 'shep5465::gems'
include_recipe 'shep5465::apache'
