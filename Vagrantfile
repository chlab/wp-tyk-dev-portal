# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.6.0'

local_ip                = "192.168.56.101"
local_host_name         = "ogdch.dev"

WINDOWS = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/) ? true : false
vagrant_dir = File.dirname(__FILE__) + "/"

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
    SYNCED_FOLDER = ".vagrant/machines/default/virtualbox/synced_folders"
    info "Trying to delete folder #{SYNCED_FOLDER}"
    begin
      File.delete(SYNCED_FOLDER)
    rescue StandardError => e
      warn "Could not delete folder #{SYNCED_FOLDER}."
      warn e.inspect
    end
  end
  # END WORKAROUND

  config.vm.provider :virtualbox do |provider, config|
    config.vm.box = "centos7"
    config.vm.box_url = "https://github.com/holms/vagrant-centos7-box/releases/download/7.1.1503.001/CentOS-7.1.1503-x86_64-netboot.box"
    
    config.nfs.map_uid = 0
    config.nfs.map_gid = 0

    if ENV['LIIP_DOCKER_CI'] == 'yes'
        config.vm.synced_folder "./web", "/var/www"
    else
        config.vm.synced_folder "./web", "/var/www", :nfs => !WINDOWS, :mount_options => ['nolock,vers=3,udp,noatime']
    end

    provider.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    provider.customize ["modifyvm", :id, "--paravirtprovider", "default"]

    # Give VM 1/4 system memory
    host = RbConfig::CONFIG['host_os']
    if host =~ /darwin/
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024
    elsif host =~ /linux/
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i
    elsif host =~ /mswin|mingw|cygwin/
      # Windows code via https://github.com/rdsubhas/vagrant-faster
      mem = `wmic computersystem Get TotalPhysicalMemory`.split[1].to_i / 1024
    end

    provider.memory = mem / 1024 / 4

    config.vm.network :private_network, ip: local_ip
    config.vm.hostname = local_host_name

    config.ssh.forward_agent = true

    config.omnibus.chef_version = "12.10.24"
    config.vm.provision :chef_solo do |chef|
      chef.version = "12.10.24"

      chef.cookbooks_path = "cookbooks"
      # chef debug level, start vagrant like this to debug:
      # $ CHEF_LOG_LEVEL=debug vagrant <provision or up>
      chef.log_level = ENV['CHEF_LOG'] || "info"
  
      # chef recipes/roles
      chef.add_recipe("vagrant")
  
      chef.json = {
        :host_name => local_host_name,
        :user => "vagrant",
        :ckan_dir => "/var/www/ckan",
        :install_dir => "/var/www/ckanext",
        :ci => ENV['LIIP_DOCKER_CI']
      }
    end
  end
end
