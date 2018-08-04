package "Install Java" do 
    package_name    'java-1.8.0-openjdk.x86_64'
    action  :install
end

remote_file 'Download Tomcat' do
    path    "/opt/#{node['stack']['TOMCAT_TAR_FILE']}"
    source "#{node['stack']['TOMCAT_URL']}"
    action :create
end

execute 'Extract tar file' do 
    command "tar -xf #{node['stack']['TOMCAT_TAR_FILE']}"
    cwd "/opt"
end

Dir["/opt/#{node['stack']['TOMCAT_DIR']}/webapps/*"].each do |webdir| 
    if File.file?("#{webdir}")
        file "Delete #{webdir}" do 
            path "#{webdir}"
            action :delete
        end
    end
    if File.directory?("#{webdir}")
        directory  "Delete #{webdir}" do 
            path "#{webdir}"
            action :delete
            recursive true
        end
    end
end

