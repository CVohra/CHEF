#!/bin/bash

NAME=$(hostname)
if [ $(hostname | cut -c 4-6) == "stg" ]; then 
  ENV=staging
elif [ $(hostname | cut -c 4-6) == "prd" ]; then 
  ENV=prod
else
  exit 
fi
sed -i -e "/node_name/ c node_name \"$NAME\" " /etc/chef/client.rb
sed -i -e "$ a environment \"$ENV\"" /etc/chef/client.rb
if [ $ENV == staging ]; then 
	chef-client -o recipe[stack]
else
	chef-client -o recipe[stack::appserver],recipe[stack::webserver]
fi
