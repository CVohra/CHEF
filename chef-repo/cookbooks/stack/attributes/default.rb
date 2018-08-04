default['stack']['TOMCAT_URL']='http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.10/bin/apache-tomcat-9.0.10.tar.gz'
default['stack']['TOMCAT_TAR_FILE']=default['stack']['TOMCAT_URL'].split('/').last
default['stack']['TOMCAT_DIR']=default['stack']['TOMCAT_TAR_FILE'].gsub('.tar.gz', '')
