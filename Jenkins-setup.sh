#!/bin/bash
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum update -y
sudo yum install jenkins java-11-openjdk-devel -y
sudo systemctl daemon-reload
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --permanent --zone=public --add-port=443/tcp
sudo firewall-cmd --reload
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins
sudo yum install nginx -y
sudo setsebool -P httpd_can_network_connect 1
sudo wget -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/alanovoy/config_files/main/Nginx.conf
sudo systemctl restart nginx
