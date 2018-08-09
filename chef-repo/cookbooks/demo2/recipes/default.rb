#
# Cookbook:: demo2
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

log 'message' do
  message "URL = #{node['demo2']['URL']}"
  level :fatal
end

log 'message' do
  message "I am added in Version 0.1.1"
  level :fatal
end


downloads = data_bag_item('tomcat', 'download')
URL=downloads['URL']

remote_file '/tmp/tomcat.tgz' do
  source URL
  action :create
end
