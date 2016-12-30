# -*- mode: ruby -*-
# # vi: set ft=ruby :

require 'yaml'
boxes = YAML.load_file('CONFIG.yml')

Vagrant.configure(2) do |config|

  boxes.each do |box, values|

    config.vm.define box do |node|
      node.vm.box       = "bento/centos-7.3"
      node.vm.hostname  = box

      if values.has_key?("public_network")
        if values["public_network"].has_key?("ip") and values["public_network"].has_key?("gateway")
          if values["public_network"]["ip"] and values["public_network"]["gateway"]
            node.vm.network "public_network", ip: values["public_network"]["ip"]
            node.vm.provision "shell", run: "always", inline: "route add default gw " + values["public_network"]["gateway"]
          end
        end
      end

      node.vm.synced_folder values["project_dir"], "/home/vagrant/www", mount_options: ["dmode=777", "fmode=777"]

      values["ports"].each do |guest, host|
        node.vm.network "forwarded_port", guest: "#{guest}", host: "#{host}"
      end

      node.vm.provision "shell", inline: "yum install -y -q -e0 -d0 epel-release"

      $host_vars = {
        'webserver' => values["webserver"],
        'php'       => values["php"],
        'pip'       => values["pip"],
        'rvm'       => values["rvm"],
      }

      node.vm.provision "ansible_local" do |ansible|
        ansible.extra_vars          = $host_vars
        ansible.provisioning_path   = "/vagrant/config"
        ansible.playbook            = "provision.yml"
      end

      node.vm.post_up_message = <<EOF
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                                                            !
! Reboot VM after INITIAL 'vagrant up' with 'vagrant reload' !
!                                                            !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
EOF

    end
  end
end
