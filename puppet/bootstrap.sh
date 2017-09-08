#!/usr/bin/env sh

echo 'Setting up "Puppet Collections" repository'
yum install -y -q -e0 -d0 https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm

echo 'Installing Puppet Agent package'
yum install -y -q -e0 -d0 puppet-agent

exit 0
