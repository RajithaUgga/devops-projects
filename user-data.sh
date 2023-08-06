#!/bin/bash
sudo hostnamectl set-hostname "ansible-controller"
echo "`hostname -I|awk '{print $1}'` `hostname`">> /etc/hosts
timedatectl set-timezone Asia/Kolkata 
sudo apt-get update
sudo apt-get install ntp -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository  --yes --update ppa:ansible/ansible 
sudo apt-get install ansible -y
