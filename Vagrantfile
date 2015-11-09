# Tested with Vagrant 1.7.4
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.synced_folder "src", "/files/"
  
  config.vm.define "dev" do |m|
    m.vm.box = "ubuntu/trusty64"
    m.vm.hostname = "dev"
    
    # Windows 10 - this doesn't work because of VBox bug. Using forwarded ports instead.
    #m.vm.network "private_network", ip: "192.168.200.200"

    m.vm.network "forwarded_port", guest: 8080, host: 7070, protocol: 'tcp'
    m.vm.network "forwarded_port", guest: 80, host: 7080, protocol: 'tcp'
  
    m.vm.provider "virtualbox" do |v|
      v.name = "dev"
      v.memory = 1024
      v.cpus = 1
    end

    config.vm.provision :shell do |sh|
      sh.path = "bootstrap.sh"
      sh.args = "/files/ansible/playbook.yml /files/ansible/hosts"
    end

  end
  
end