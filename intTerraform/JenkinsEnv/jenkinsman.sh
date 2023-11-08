#!/bin/bash

# Update first before installing 
# Install Java required for Jenkins
# -y to fully automize the process 

sudo apt update 
sudo apt install -y openjdk-11-jre

# Add the required repos before installing jenkins

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
# update system one more time before installing jenkins
sudo apt update
sudo apt install -y jenkins

# Start Jenkins
sudo systemctl start jenkins

sudo apt update

sudo apt install -y software-properties-common

sudo add-apt-repository -y ppa:deadsnakes/ppa

sudo apt install -y python3.7

sudo apt install -y python3.7-venv

sudo apt install -y build-essential

sudo apt install -y libmysqlclient-dev

sudo apt install -y python3.7-dev
