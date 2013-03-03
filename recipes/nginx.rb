# -*- coding: utf-8 -*-
#
# Cookbook Name:: httphq cookbook
# Recipe:: default
#
# :copyright: (c) 2012 - 2013 by Alexandr Lispython (alex@obout.ru).
# :license: BSD, see LICENSE for more details.
# :github: http://github.com/Lispython/httphq-cookbook
#

include_recipe "httphq::default"

Chef::Log.info("Making nginx frontend for httphq service")


template "#{node[:nginx][:dir]}/sites-available/httphq.conf" do
  source 'nginx.conf.erb'
  owner user
  group user
  variables()

  notifies :reload, resources(:service => "nginx")
end

nginx_site "httphq.conf"
