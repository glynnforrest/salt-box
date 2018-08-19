Vagrant.configure(2) do |config|
  # sync of this folder is disabled to prevent problems with top file symlinks
  # these vms aren't provisioned automatically, think of them as
  # ready-made blank machines
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.define "lamp" do |m|
    m.vm.box = "debian/jessie64"
    m.vm.hostname = 'lamp'
    m.vm.network "private_network", ip: "192.168.10.2"

    m.vm.synced_folder "~/notes", "/home/vagrant/notes"

    config.vm.provider :virtualbox do |vb|
      # lots of memory for composer updates
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--name", "lamp"]
    end
  end
end
