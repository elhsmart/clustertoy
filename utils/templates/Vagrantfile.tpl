# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

{{#nodes}}
  config.vm.define "{{name}}" do |{{name}}|
    {{name}}.vm.box = "gentoo_chef"
    {{name}}.vm.network :private_network, ip: "{{ip}}"

    {{name}}.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "{{chef_cookbook_path}}"
      chef.roles_path = "{{chef_roles_path}}"
      chef.add_role("{{role}}")
      chef.json = {
        "net" => {
          "hostname" => "{{name}}"{{#fqdn}},
          "fqdn" => "{{fqdn}}"{{/fqdn}}
        }{{#binhost}},
        "binary-package-client" => {
          "host" => "{{binhost}}"
        }{{/binhost}}
      }
    end
  end

{{/nodes}}
end