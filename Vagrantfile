Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.hostname = 'salt-box'

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--name", "salt-box"]
    vb.gui = true
  end

  config.vm.network :private_network, ip: "192.168.10.2"

  config.vm.provision :salt do |salt|
    salt.install_type = "stable"
    salt.install_master = false
    salt.verbose = true
    salt.colorize = true
    salt.run_highstate = false
    salt.masterless = true
    salt.bootstrap_options = '-c /tmp'
    salt.minion_config = "conf/minion_vagrant"
  end
end
