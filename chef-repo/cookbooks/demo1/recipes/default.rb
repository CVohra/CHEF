#
# Cookbook:: demo1
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
puts "Hello from Demo1 Cookbook"

if node['demo1']['DBIP'] == 'local'
  ip = node['ipaddress']
else
  ip = node['demo1']['DBIP']
end

template '/tmp/sample' do
  source 'sample.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables({
    :MAINIP => ip
  })
end
