#!/usr/bin/env sh

echo 'Setting up "Puppet Collections" repository'
yum install -y -q -e0 -d0 https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm

echo 'Installing Puppet Agent package'
yum install -y -q -e0 -d0 puppet-agent

exit 0
