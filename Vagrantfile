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
  # START WORKAROUND for https://github.com/mitchellh/vagrant/issues/5199
  # Require the Trigger plugin for Vagrant
  unless Vagrant.has_plugin?('vagrant-triggers')
    # Attempt to install ourself.
    # Bail out on failure so we don't get stuck in an infinite loop.
    system('vagrant plugin install vagrant-triggers') || exit!

    # Relaunch Vagrant so the new plugin(s) are detected.
    # Exit with the same status code.
    exit system('vagrant', *ARGV)
  end

  config.trigger.before [:reload, :up, :provision], stdout: true do
    SYNCED_FOLDER = ".vagrant/machines/default/#{ENV['VAGRANT_DEFAULT_PROVIDER']}/synced_folders"
    info "Trying to delete folder #{SYNCED_FOLDER}"
    begin
      File.delete(SYNCED_FOLDER)
    rescue StandardError => e
      warn "Could not delete folder #{SYNCED_FOLDER}."
      warn e.inspect
    end
  end
  # END WORKAROUND

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
      :ckan_dir => "#{data['vm']['synced_folder']['vflsf_0t01o3pxhnte']['target']}/ckan",
      :install_dir => "#{data['vm']['synced_folder']['vflsf_0t01o3pxhnte']['target']}/ckanext"
    }
  end
end
