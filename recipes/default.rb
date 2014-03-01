#
# Cookbook Name:: wp-scaffold
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "wordpress::default"
include_recipe "wp-cli::default"

wp_core_install do
    url node['fqdn']
    title 'WP Scaffold'
    admin_user 'admin'
    admin_password 'admin'
    admin_email 'codecreateconnect@gmail.com'
    dir node['wp-cli']['site-dir']
end