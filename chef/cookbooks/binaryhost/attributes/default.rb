#
# Cookbook Name:: binary-package-host
# Attributes:: default
#
default['binary-package-host']['http-host']     = '0.0.0.0'
default['binary-package-host']['http-port']     = '8080'
default['binary-package-host']['virtualhost']   = '/etc/nginx/sites-available/binhost.conf'
default['binary-package-host']['pkgdir']        = '/var/portage/binary'