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

remote_file 'Download Student war file' do
    path    "/opt/#{node['stack']['TOMCAT_DIR']}/webapps/student.war"
    source "#{node['stack']['WAR_URL']}"
    action :create
end


remote_file 'Download JDBC Driver' do
    path    "/opt/#{node['stack']['TOMCAT_DIR']}/lib/mysql-connector-java-5.1.40.jar"
    source "#{node['stack']['JDBC_URL']}"
    action :create
end

if node['stack']['DBIP'] == 'local'
    ip = node['ipaddress']
  else
    ip = node['stack']['DBIP']
  end

template 'Updating Context.xml file' do 
   path "/opt/#{node['stack']['TOMCAT_DIR']}/conf/context.xml"
   source "context.xml.erb"
   variables({
    :MAINIP => ip
  })
end


if system('ps -ef | grep java | grep -v grep')
    execute "Stopping Tomcat" do 
        command "/opt/#{node['stack']['TOMCAT_DIR']}/bin/shutdown.sh"
    end
end

execute "Starting Tomcat" do 
    command "/opt/#{node['stack']['TOMCAT_DIR']}/bin/startup.sh"
end




