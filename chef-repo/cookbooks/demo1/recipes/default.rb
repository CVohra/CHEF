#
# Cookbook:: demo1
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
puts "Hello from Demo1 Cookbook"

ruby_block 'reload_client_config' do
  block do
    $a=10
  end
  action :run
end

ruby_block 'reload_client_config' do
  block do
    puts "#{$a}"
  end
  action :run
end


#template '/tmp/sample' do
#  source 'sample.erb'
#  owner 'root'
#  group 'root'
#  mode '0755'
#  variables({
#    :MAINIP => ip
#  })
#end
