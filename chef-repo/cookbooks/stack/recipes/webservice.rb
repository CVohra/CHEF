%w(httpd httpd-devel gcc).each do |pack_name|
    package "Installing #{pack_name}" do 
        package_name "#{pack_name}" 
        action :install
    end 
end

remote_file "Download ModJK" do 
    path    "/opt/#{node['stack']['MOJK_TAR_FILE']}"
    source "#{node['stack']['MODJK_URL']}"
    action :create
end

execute 'Extract MODJK tar file' do 
    command "tar -xf #{node['stack']['MOJK_TAR_FILE']}"
    cwd "/opt"
end

execute 'Extract MODJK tar file' do 
    command "./configure  --with-apxs=/usr/bin/apxs && make && make install"
    cwd "/opt/#{node['stack']['MODJK_DIR']}/native"
end

%w(mod_jk.conf workers.properties).each do |file_name|
    cookbook_file "Copying #{file_name}" do
        path    "/etc/httpd/conf.d/#{file_name}"
        source "#{file_name}"
        action :create
    end
end

service "Restart Web Service" do 
    service_name "httpd"
    action [ :restart , :enable ]
end
