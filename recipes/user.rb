# -*- coding: utf-8 -*-
#
# Cookbook Name:: sentry cookbook
# Recipe:: user
#
# :copyright: (c) 2012 - 2013 by Alexandr Lispython (alex@obout.ru).
# :license: BSD, see LICENSE for more details.
# :github: http://github.com/Lispython/sentry-cookbook
#

group node["httphq"]["group"] do
  action :create
  system true
  not_if "grep #{node['httphq']['group']} /etc/group"
end

user node["httphq"]["user"] do

  if node["httphq"]["userhome"]
    home node["httphq"]["userhome"]
  end

  comment "httphq service user"
  gid node["httphq"]["group"]
  system true
  shell "/bin/bash"
  action :create
  not_if "grep #{node['httphq']['user']} /etc/passwd"
end
