#
# Cookbook Name:: binary-package-client
# Attributes:: default

ruby_block "PORTAGE_BINHOST append / edit make.conf" do
  block do
    rc = Chef::Util::FileEdit.new("/etc/portage/make.conf")
    rc.insert_line_if_no_match(
      /^PORTAGE_BINHOST=\"([^\"]{1,})\"$/,
      "PORTAGE_BINHOST=\""+node['binary-package-client']['host']+"\""
    )
    rc.write_file
  end
end