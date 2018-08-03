#!/bin/bash

NAME=$(hostname)
sed -i -e "/node_name/ c node_name \"$NAME\" " /etc/chef/client.rb
chef-client 
