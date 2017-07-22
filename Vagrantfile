Vagrant.configure(2) do |config|
  # sync of this folder is disabled to prevent problems with top file symlinks
  # these vms aren't provisioned automatically, think of them as
  # ready-made blank machines
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.define "debian" do |m|
    m.vm.box = "debian/jessie64"
    m.vm.hostname = 'salt-box-debian'
    m.vm.network "private_network", ip: "192.168.10.2"

    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1536"]
      vb.customize ["modifyvm", :id, "--name", "salt-box-debian"]
      vb.gui = true
    end
  end
end
