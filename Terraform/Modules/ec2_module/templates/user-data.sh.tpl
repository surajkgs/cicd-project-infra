#!/bin/bash
sudo mkdir -p "test"
sudo touch file1.txt
sudo touch file2.txt
echo "pwd" > /tmp/tmpfile
sudo apt-get update -y
sudo apt-get install openjdk-8-jdk
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update -y
apt-get install jenkins -y
sudo service jenkins start