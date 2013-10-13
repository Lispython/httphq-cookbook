# -*- coding: utf-8 -*-
#
# Cookbook Name:: httphq cookbook
#
# :copyright: (c) 2012 - 2013 by Alexandr Lispython (alex@obout.ru).
# :license: BSD, see LICENSE for more details.
# :github: http://github.com/lispython/httphq-cookbook
#

default["httphq"]["user"] = "httphq"
default["httphq"]["group"] = "httphq"
default["httphq"]["userhome"] = "/home/#{node['httphq']['user']}"
default["httphq"]["virtualenv"] = "/var/www/httphq"
default["httphq"]["name"] = "httphq"

default["httphq"]["version"] = "0.0.6"

default["httphq"]["servers"] = [{
  "host" => "127.0.0.1",
  "port" => 8889
}]
default["httphq"]["log_level"] = "WARNING"
default["httphq"]["log_dir"] = "/var/log/httphq"
default["httphq"]["pid_dir"] = "/var/run"


default["httphq"]["nginx"] = {
  "domain" => "localhost",
  "ip_address" => "0.0.0.0",
  "port" => 80
}
