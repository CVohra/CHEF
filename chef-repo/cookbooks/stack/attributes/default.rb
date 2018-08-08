default['stack']['TOMCAT_URL']='http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.10/bin/apache-tomcat-9.0.10.tar.gz'
default['stack']['TOMCAT_TAR_FILE']=default['stack']['TOMCAT_URL'].split('/').last
default['stack']['TOMCAT_DIR']=default['stack']['TOMCAT_TAR_FILE'].gsub('.tar.gz', '')
default['stack']['WAR_URL']='https://github.com/cit-aliqui/APP-STACK/raw/master/student.war'
default['stack']['JDBC_URL']='https://github.com/cit-aliqui/APP-STACK/raw/master/mysql-connector-java-5.1.40.jar'
default['stack']['DBUSER']='student'
default['stack']['DBPASS']='student@1'
default['stack']['DBNAME']='studentapp'

default['stack']['MODJK_URL']='http://www-us.apache.org/dist/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.43-src.tar.gz'
default['stack']['MOJK_TAR_FILE']=default['stack']['MODJK_URL'].split('/').last
default['stack']['MODJK_DIR']=default['stack']['MOJK_TAR_FILE'].gsub('.tar.gz', '')
