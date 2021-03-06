# About
Provides CentOS virtual machine with preconfigured PHP development environment.

Supports different versions of PHP: 5.4, 5.6, 7.0, 7.1. And two major web servers of choicei, Apache and Nginx.

By default it will install Apache + PHP-FPM v7.0

You can access PhpMyAdmin via http://localhost:8080/pma/ (trailing slash is required)

Version of PhpMyAdmin in this setup supports only PHP v5.6+

Access PHP-FPM status page by this url: http://localhost:8080/status

ATM it is not possible to configure VM with "public" or "private" networks

# Usage
1. Install Oracle VirtualBox https://www.virtualbox.org/wiki/Downloads with VirtualBox Extension Pack
2. Install Vagrant https://www.vagrantup.com/downloads.html (version >= 1.9.1)
3. Clone this repository to some directory on your machine
4. Edit `CONFIG.yml` in cloned directory. Set your `project_dir`. Optionally disable/enable other features, which are described below.
5. Run console command `vagrant up`
6. Run `vagrant reload` after initial/first `vagrant up`

##### CONFIG options
Full example in CONFIG.yml
* **project_dir** - Directory which contains your project. Forward slashes (*nix style) should be used as directory separator, even on Windows machine.
* **provision** - optional. true, false or puppet. default true
* **php** - possible integer values: 54, 56, 70, 71. which correspond to PHP versions 5.4, 5.6, etc.
* **rvm** - `no/yes` installs stable RVM. This installs RVM only. You have to install Ruby of your choice on your own. Example `rvm list known` and `rvm install 2.4`
* **pip** - `no/yes` installs PIP
* **ports** - list of ports you want to expose to host system "vm_port: host_port"
* **config** - optional. Name of config file to apply on node. Node hash should has values required by this config file.
* **hw** - optional. Customize hardware parameters of vm. Can supply `cpu` and `memory`, or one of those two.

##### Common Vagrant CLI commands
* `vagrant up` - turn on machine or build machine when not exists
* `vagrant reload [--provision]` - restart machine [reprovision, if supplied]
* `vagrant halt` -  shut down machine
* `vagrant destroy` - complete destroy virtual machine
* `vagrant ssh` - login into virtual machine
