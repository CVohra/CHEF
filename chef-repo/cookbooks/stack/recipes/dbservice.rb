package 'Install MariaDB Server Service' do
    package_name               "mariadb-server"
    action                     :install
end

service "Start MariaDB Service" do 
    service_name  "mariadb"
    action [ :enable, :start ]
end

cookbook_file 'Copying student.sql file' do
    path    '/tmp/student.sql'
    source  'student.sql'
    action :create
end

execute 'Import MySQL Dump' do
    command 'mysql </tmp/student.sql'
end