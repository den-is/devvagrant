# -*- mode: ruby -*-
# # vi: set ft=ruby :

# HELP ##########################################################
#
# PROJECT_WWW_DIR - directory which contains your project
#                   will be available in vagrant
#                   forward slashes should be used as directory separator
# PHP54 - "yes" will install default PHP 5.4 from CentOS 7.2 repo.
#         "no" will install PHP 5.6 from WebTatic repository
# RVM - "yes" will install stable RVM
# PIP - "yes" will install PIP
# PORTS - list of ports you want to expose to host system
#
# CONFIGURATION #################################################

PROJECT_WWW_DIR  = "C:/Users/username/projects/project/www"
PHP54 = "no"
RVM = "no"
PIP = "no"

PORTS={
#   "guest" => host,
    "80"    => 8080,
}

#################################################################

Vagrant.configure(2) do |config|

  HOSTNAME = "devbox" # Leave it, nobody cares

  config.vm.define HOSTNAME do |node|
    node.vm.box       = "bento/centos-7.2"
    node.vm.hostname  = HOSTNAME

    node.vm.synced_folder PROJECT_WWW_DIR, "/home/vagrant/www", mount_options: ["dmode=777", "fmode=777"]

    PORTS.each do |guest, host|
      node.vm.network "forwarded_port", guest: "#{guest}", host: "#{host}"
    end

    node.vm.provision "shell" do |sh|
      sh.path = "config/inject.sh"
      sh.args = [PHP54, RVM, PIP]
    end

    node.vm.provision "shell", inline: "yum install -y -q -e0 -d0 epel-release"

    node.vm.provision "ansible_local" do |ansible|
      ansible.provisioning_path   = "/vagrant/config"
      ansible.playbook            = "provision.yml"
    end
  end
end
