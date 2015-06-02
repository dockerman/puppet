#bin/bash!
echo "Hello, $USER. Your Puppet AGENT node is being configured ..."

echo "52.28.121.253 puppet" >> /etc/hosts

echo "Type a *unique* name for your Puppet AGENT, followed by [ENTER]:"

read name

echo "Type your Public AGENT IP carefuly ..."

read public_ip

echo "Your name: $name is being configured ..."

echo "$name" >> /etc/hostname

hostname $name

echo "$public_ip $name" >> /hosts



apt-get update

apt-get install -y puppet

apt-get install -y ntp

find /var/lib/puppet/ssl -name '*.pem' -exec rm {} \;

puppet agent -t --waitforcert=240
