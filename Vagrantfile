# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'yaml'
boxes = YAML.load_file('CONFIG.yml')

postupmessage = <<EOF
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                                                            !
! Reboot VM after INITIAL 'vagrant up' with 'vagrant reload' !
!                                                            !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
EOF

Vagrant.configure(2) do |config|

  boxes.each do |box, values|

    config.vm.define box do |node|
      node.vm.box       = "bento/centos-7.3"
      node.vm.hostname  = box

      if values.has_key?("hw")
        node.vm.provider "virtualbox" do |vb|
          if values["hw"].has_key?("cpu")
            vb.cpus = values["hw"]["cpu"]
          end
          if values["hw"].has_key?("ram")
            vb.memory = values["hw"]["ram"]
          end
        end
      end

      node.vm.synced_folder values["project_dir"], "/home/vagrant/www", mount_options: ["dmode=777", "fmode=777"]

      values["ports"].each do |guest, host|
        node.vm.network "forwarded_port", guest: guest, host: host
      end

      provision = values.fetch("provision", true)

      if provision and provision != "puppet"
        node.vm.provision "ansible_local" do |ansible|
          ansible.extra_vars          = values
          ansible.provisioning_path   = "/vagrant/config"
          ansible.playbook            = values.fetch("config", "complete.yml")
        end
        node.vm.post_up_message = postupmessage
      elsif provision == "puppet"
        node.vm.provision "shell", path: "puppet/bootstrap.sh"
        node.vm.provision "puppet" do |puppet|
          puppet.environment_path = "puppet"
          puppet.environment = "production"
          puppet.hiera_config_path = "puppet/hiera.yaml"
        end
      end

    end
  end
end
