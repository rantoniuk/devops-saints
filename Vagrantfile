# Tested with Vagrant 1.7.4
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.synced_folder "src", "/files/"
  
  config.vm.define "dev" do |m|
    m.vm.box = "ubuntu/trusty64"
    m.vm.hostname = "dev"
    
    # Comment this line out and set up networking manually in VBox for Windows 10
    #m.vm.network "private_network", ip: "192.168.200.200"

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