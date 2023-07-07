Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
      config.vm.define "master" do |node|
        node.vm.hostname = "master-node"

# Public network configuration
node.vm.network "public_network", bridge: "enp4s0", ip: "192.168.1.0"
        node.vm.provider "virtualbox" do |vb|
            vb.memory = 4096
            vb.cpus = 2
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
end
end
   config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "1"
       config.vm.define "worker-01" do |node|
        node.vm.hostname = "worker-01"
 node.vm.network "public_network", bridge: "enp4s0", ip:"192.168.1.10"
        node.vm.provider "virtualbox" do |vb|
            vb.memory = 2048 
            vb.cpus = 1
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
end
end
   config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "1"
       config.vm.define "worker-02" do |node|
        node.vm.hostname = "worker-02"
  node.vm.network "public_network", bridge: "enp4s0", ip:"192.168.1.11"
        node.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
            vb.cpus = 1
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

end
end
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "1"
       config.vm.define "worker-03" do |node|
        node.vm.hostname = "worker-03"
   node.vm.network "public_network", bridge: "enp4s0", ip:"192.168.1.12"
        node.vm.provider "virtualbox" do |vb|
            vb.memory = 16384
            vb.cpus = 3
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

end
end
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "1"
       config.vm.define "worker-04" do |node|
        node.vm.hostname = "worker-04"
    node.vm.network "public_network", bridge: "enp4s0", ip:"192.168.1.12"
        node.vm.provider "virtualbox" do |vb|
            vb.memory = 16384
            vb.cpus = 3
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
end
end
