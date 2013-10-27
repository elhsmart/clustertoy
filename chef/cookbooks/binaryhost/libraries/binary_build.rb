#
# Author:: Ezra Zygmuntowicz (<ezra@engineyard.com>)
# Modified:: Ed Tretyakov (elhsmart@gmail.com)
# Copyright:: Copyright (c) 2008 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This is monkeypatch for default Gentoo Package provider
# to receive binary packages during build
#

require 'chef/provider/package'
require 'chef/mixin/command'
require 'chef/resource/package'

class Chef
  class Provider
    class Package
      class Portage < Chef::Provider::Package
        def install_package(name, version)
          pkg = "=#{name}-#{version}"

          if(version =~ /^\~(.+)/)
            # If we start with a tilde
            pkg = "~#{name}-#{$1}"
          end

          run_command_with_systems_locale(
            :command => "emerge -g --buildpkg --buildpkg-exclude 'virtual/*' --color n --nospinner --quiet#{expand_options(@new_resource.options)} #{pkg}"
          )
        end
      end
    end
  end
end