#!/bin/bash
# Stop Tomcat
sudo systemctl stop tomcat
# Remove existing application
rm -rf /opt/tomcat/webapps/MyApp.war
