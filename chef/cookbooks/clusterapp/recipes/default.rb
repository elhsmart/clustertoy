#
# Cookbook Name:: clusterapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"

nginx_site "default" do
    action :enable
end
