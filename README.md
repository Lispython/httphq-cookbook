Description
===========

Cookbook for setup and configure [httphq](http://github.com/lispython/httphq) application.

Requirements
============

[python](https://github.com/opscode-cookbooks/python)

Attributes
==========

All default values of attributes you can see in `attributes/default.rb`


Usage
=====
To use the cookbook we recommend creating a cookbook named after the application, e.g. my_app.
In metadata.rb you should declare a dependency on this cookbook:

Include ``recipe[httphq]`` to you runlist.

Add ``recipe[httphq::instance]`` to you runlist.

If ypu want to use nginx, add ``recipe[httphq::nginx]`` to you runlist.

Or make you own custom configuration via resouces and definitions.

Definitions
===========

#### Attributes

- ``name`` package name
- ``user`` user that own application
- ``group`` gtoup that own application
- ``virtualenv`` path to virtualenv directory
- ``version`` httphq version to install
- ``servers`` list of instances servers
- ``log_level`` log messages level
- ``log_dir`` directory with logs
- ``pid_fir`` directory for pidfiles

##### Nginx attributes

Specify if you want to use nginx as frontend

- ``node["nginx"]["domain"]`` - domain for server_name
- ``node["nginx"]["ip_address"]`` - ip address that listen nginx
- ``node["nginx"]["port"]`` - port that listen nginx

Resources
=========


Recipes
=======

default
-------
Activate dependences

user
----

Base recipe to configure httphq user and group

instance
--------

Recipe to install simple httphq instance.

nginx
-----

Recipe that configure frontent for ``node["httphq"]["servers"]``


See also
========

- [Request & Respose service](https://h.wrttn.me/)