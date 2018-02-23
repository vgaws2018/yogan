#!/bin/sh

#Create tomcat directory
mkdir -p /opt/tomcat/
cd /opt/tomcat/

#Dowloading tomcat installables
wget http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.28/bin/apache-tomcat-8.5.28.tar.gz

#Installing tomcat
tar -xvzf apache-tomcat-8.5.28.tar.gz
cd apache-tomcat-8.5.28/bin/
chmod 777 startup.sh shutdown.sh catalina.sh

#Changing port of tomcat
cd /opt/tomcat/apache-tomcat-8.5.28/conf
sed -i 's/8080/8088/g' server.xml

#Starting Tomcat instance
#sh startup.sh

# War deployement 
cd /opt/tomcat/apache-tomcat-8.5.28/webapps/
wget https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/sample.war 
cd /opt/tomcat/apache-tomcat-8.5.28/bin/
# starting Tomcat services.
sh catalina.sh start


 
