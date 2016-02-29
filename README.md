# Usage

1. Install Oracle VirtualBox https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant https://www.vagrantup.com/downloads.html
3. Clone this repository to some directory on your machine
4. [Optional] Edit `Vagrantfile` in cloned directory
5. Run console command `vagrant up`
6. Run `vagrant reload` after initial/first `vagrant up`

##### Vagratfile paramaters
* **PROJECT_WWW_DIR** - Directory which contains your project. Forward slashes (*nix style) should be used as directory separator, even on Windows machine.
* **PHP54** - `yes` for default PHP  from CentOS repo (5.4).`no` for PHP 5.6 from WebTatic repository (default)
* **RVM** - `yes` installs stable RVM
* **PIP** - `yes` installs PIP
* **PORTS** - list of ports you want to expose to host system

##### Optional paramaters
* **IP_ADDRESS** = "" - IP from address pool of your current LAN
* **GATEWAY** = "" - IP of Default Gateway on your current LAN
* **HOSTNAME** = "devbox" - Line 34. Hostname for virtualmachine

##### Common Vagrant CLI commands
* `vagrant up` - turn on machine or build machine when not exists
* `vagrant reload [--provision]` - restart machine
* `vagrant halt` -  shut down machine
* `vagrant destroy` - complete destroy virtual machine
* `vagrant ssh` - login into virtual machine
