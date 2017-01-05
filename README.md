# Usage
1. Install Oracle VirtualBox https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant https://www.vagrantup.com/downloads.html (version >= 1.9.1)
3. Clone this repository to some directory on your machine
4. Edit `CONFIG.yml` in cloned directory. Set your `project_dir`. Optionally disable/enable other features, which are described below.
5. Run console command `vagrant up`
6. Run `vagrant reload` after initial/first `vagrant up`

##### CONFIG options
Full example in CONFIG.yml
* **project_dir** - Directory which contains your project. Forward slashes (*nix style) should be used as directory separator, even on Windows machine.
* **php** - possible integer values: 54, 56, 70, 71. which correspond to PHP versions 5.4, 5.6, etc.
* **rvm** - `no/yes` installs stable RVM
* **pip** - `no/yes` installs PIP
* **ports** - list of ports you want to expose to host system "vm_port: host_port"
* **public_network** - optional. If you want to enable direct access to VM over network, supply values for `ip` and `gateway`.
* **hw** - optional. Customize hardware parameters of vm. Can supply `cpu` and `memory`, or one of those two.

##### Common Vagrant CLI commands
* `vagrant up` - turn on machine or build machine when not exists
* `vagrant reload [--provision]` - restart machine [reprovision, if supplied]
* `vagrant halt` -  shut down machine
* `vagrant destroy` - complete destroy virtual machine
* `vagrant ssh` - login into virtual machine
