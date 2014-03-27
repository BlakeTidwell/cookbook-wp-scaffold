#
# Cookbook Name:: wp-scaffold
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "wordpress::default"
include_recipe "composer::default"
include_recipe "wp-cli::default"

composer_project "#{node['wordpress']['dir']}" do
  dev false
  quiet true
  action :install
end

wp_core_install do
    url node['fqdn']
    title node['wp_scaffold']['title']
    admin_user node['wp_scaffold']['admin_user']
    admin_password node['wp_scaffold']['admin_password']
    admin_email node['wp_scaffold']['admin_email']
    dir node['wp_scaffold']['dir']
end

if !node['wp_scaffold']['plugins']['include'].empty?
  node['wp_scaffold']['plugins']['include'].each do |plugin|
    log "Installing #{plugin}"
    wp_activate plugin do
      type :plugin
    end
  end
elsif !node['wp_scaffold']['plugins']['exclude'].empty?
  puts "Install except for specific list"
else
  puts "Do not install any plugins"
end