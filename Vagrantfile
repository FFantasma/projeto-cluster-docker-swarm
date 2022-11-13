# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "node-master" => {"memory" => "1024", "cpu" => "1", 'ip' => '50', "image" => "bento/ubuntu-22.04"},
  "node-worked02" => {"memory" => "1024", "cpu" => "1", 'ip' => '51', "image" => "bento/ubuntu-22.04"},
  "node-worked03" => {"memory" => "1024", "cpu" => "1", 'ip' => '52', "image" => "bento/ubuntu-22.04"},
  "node-worked04" => {"memory" => "1024", "cpu" => "1", 'ip' => '53', "image" => "bento/ubuntu-22.04"},
  #"node05" => {"memory" => "1024", "cpu" => "1", "image" => "bento/ubuntu-22.04"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "public_network", ip: "192.168.0.#{conf['ip']}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        
      end
      machine.vm.provision "shell", path: "instalar-docker.sh"   

      if "#{name}" == "node-master"
        machine.vm.provision "shell", path: "master.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
      end
    end
  end
end