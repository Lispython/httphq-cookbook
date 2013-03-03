# -*- coding: utf-8 -*-
#
# Cookbook Name:: httphq cookbook
# Recipe:: default
#
# :copyright: (c) 2012 - 2013 by Alexandr Lispython (alex@obout.ru).
# :license: BSD, see LICENSE for more details.
# :github: http://github.com/Httphq/httphq-cookbook
#

include_recipe "httphq::default"


Chef::Log.info("Making directory for virtualenv: #{node["httphq"]["virtualenv"]}")

# Making application virtualenv directory
directory node["httphq"]["virtualenv"] do
  owner node["httphq"]["user"]
  group node["httphq"]["group"]
  mode 0777
  recursive true
  action :create
end


Chef::Log.info("Making virtualenv: #{node["httphq"]["virtualenv"]}")

# Creating virtualenv structure
python_virtualenv node["httphq"]["virtualenv"] do
  owner node["httphq"]["user"]
  group node["httphq"]["group"]
  action :create
end

# Intstall sentry via pip
python_pip node["httphq"]["name"] do
  provider Chef::Provider::PythonPip
  user node["httphq"]["user"]
  group node["httphq"]["group"]
  virtualenv node["httphq"]["virtualenv"]
  version node["httphq"]["version"]
  action :install
end

node["httphq"]["servers"].each do |server|

  # Run httphq aggregator instances
  Chef::Log.info("httphq server #{server}")

  runit_service  "httphq-#{server['port']}" do
    template_name "httphq"
    log_template_name "httphq"

    options(:user => node["httphq"]["user"],
            :group => node["httphq"]["group"],
            :service_name => "httphq-#{server['port']}",
            :pidfile => "#{node["httphq"]["pid_dir"]}/httphq-#{server["port"]}.pid",
            :port => server["port"],
            :host => server["host"],
            :virtualenv => "#{node["httphq"]["virtualenv"]}",
            :log_folder => "#{node["httphq"]["log_dir"]}/httphq/")
  end
end
