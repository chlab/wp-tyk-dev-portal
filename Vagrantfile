dir = File.dirname(File.expand_path(__FILE__))

require 'yaml'
require "#{dir}/puphpet/ruby/deep_merge.rb"

configValues = YAML.load_file("#{dir}/puphpet/config.yaml")

if File.file?("#{dir}/puphpet/config-custom.yaml")
  custom = YAML.load_file("#{dir}/puphpet/config-custom.yaml")
  configValues.deep_merge!(custom)
end

data = configValues['vagrantfile']

Vagrant.require_version '>= 1.6.0'

eval File.read("#{dir}/puphpet/vagrant/Vagrantfile-#{data['target']}")

Vagrant.configure("2") do |config|
  config.omnibus.chef_version = :latest
  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = "cookbooks"
    # chef debug level, start vagrant like this to debug:
    # $ CHEF_LOG_LEVEL=debug vagrant <provision or up>
    chef.log_level = ENV['CHEF_LOG'] || "info"

    # chef recipes/roles
    chef.add_recipe("vagrant")

    chef.json = {
      :host_name => data['vm']['hostname'],
      :user => "vagrant",
      :repository => "https://github.com/ckan/ckan.git",
      :install_dir => "#{data['vm']['synced_folder']['vflsf_0t01o3pxhnte']['target']}/ckanext"
    }
  end
end
