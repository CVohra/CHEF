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
	chef-client -o recipe[stack] &>>/tmp/chef.log
else
        if [ $(hostname | cut -c 7-9) == 'app' ]; then 
            chef-client -o recipe[stack::appservice],recipe[stack::webservice] &>>/tmp/chef.log
        elif [ $(hostname | cut -c 7-9) == 'dbs' ]; then 
            chef-client -o recipe[stack::dbservice]
	fi
      
fi
