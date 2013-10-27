#
# Cookbook Name:: binary-package-host
# Attributes:: default

directory node['binary-package-host']['pkgdir'] do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

ruby_block "edit make.conf" do
  block do
    rc = Chef::Util::FileEdit.new("/etc/portage/make.conf")
    rc.insert_line_if_no_match(
      /^PKGDIR=\"([^\"]{1,})\"$/,
      "PKGDIR=\""+node['binary-package-host']['pkgdir']+"\""
    )
    rc.write_file
  end
end

file "/etc/portage/make.conf" do
  puts "PKGDIR="+node['binary-package-host']['pkgdir']
end

include_recipe "nginx"

template "#{node["nginx"]["dir"]}/sites-available/binary_host.conf" do
  source 'binary_host.conf.erb'
  owner  'nginx'
  group  'nginx'
  mode   '0644'
  variables(
    :listen_host    => node['binary-package-host']['http-host'],
    :listen_port    => node['binary-package-host']['http-port'],
    :root_dir       => node['binary-package-host']['pkgdir'],
    :log_dir        => node['nginx']['log_dir']
  )
end

execute "nxensite binary_host.conf" do
  command "/usr/sbin/nxensite binary_host.conf"
  notifies :restart, "service[nginx]", :delayed
end
