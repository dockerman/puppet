#bin/bash!
echo "Hello, $USER. Your Puppet MASTER node is being configured ..."

echo "52.28.121.253 puppet" >> /etc/hosts

echo "Type the name of your new Puppet AGENT followed by [ENTER]:"

read agent_name

echo "Type your Agent Public IP carefuly ..."

read agent_ip

echo "Your name: $agent_name is being configured ..."


echo "$agent_ip $agent_name" >> /etc/hosts


echo "puppet" >> /etc/hostname

hostname puppet


apt-get update

apt-get install -y puppetmaster

apt-get install -y ntp

find /var/lib/puppet/ssl -name agenthost.domain.com.pem -exec rm {} \;

puppet cert sign $agent_name.localdomain
