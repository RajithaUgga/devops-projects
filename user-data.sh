######################   ansible-server

#!/bin/bash
sudo hostnamectl set-hostname "ansible-controller"
echo "`hostname -I|awk '{print $1}'` `hostname`">> /etc/hosts
timedatectl set-timezone Asia/Kolkata 
sudo apt-get update
sudo apt-get install ntp -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository  --yes --update ppa:ansible/ansible 
sudo apt-get install ansible -y
# connect the instance
ansible --version

# ansible home path /etc/ansible
ls -lrta /etc/ansible
cp -pvr /etc/ansible/hosts  "/etc/ansible/hosts_$(date +%F_%R)"
vi /etc/ansible/hosts
# provide the nodes private ip
su - ubuntu
cd /home/ubuntu
cd .ssh
cat .ssh/authorized_keys
ssh-keygen
cat id_rsa.pub  #copy the public key into the node

exit
ssh private_ip_of_node1  #to check the connection
exit

ansible-playbook --syntax playbook-project1.yml
ansible-playbook --check  playbook-project1.yml
#run the playbook
ansible-playbook  playbook-project1.yml


########################  Jenkins Server
#!/bin/bash
sudo hostnamectl set-hostname "jenkins"
echo "`hostname -I|awk '{print $1}'` `hostname`">> /etc/hosts
# connect the jenkins server then run the below commands
java -version
mvn --version
sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/" >> /etc/environment
sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "MAVEN_HOME=/usr/share/maven" >> /etc/environment
source /etc/environment #For compiling the configuation
echo $JAVA_HOME
echo $MAVEN_HOME

cat /etc/os-release
su - ubuntu
pwd
cd /home/ubuntu
cd .ssh
cat authorized_keys
vi authorized_keys #paste the public key from ansible-controller machine
exit # from ubuntu to root




