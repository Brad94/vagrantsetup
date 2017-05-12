#!/usr/bin/env bash
cd /opt/vagrant_data/
sudo apt-get update -y

apt-get install -y git
echo "Finished Git"


if [ -f "/opt/vagrant_data/jenkins_2.1_all.deb"]
then
	echo "Jenkins file found."
else
	echo "Jenkins file not found."
	#can download
fi
sudo dpkg -i jenkins_2.1_all.deb
sudo apt-get install -f -y
sudo apt-get install -y jenkins
sudo service jenkins start
echo "Finished Jenkins"


if [ -f "/opt/vagrant_data/java.tar.gz"]
then
	echo "Java File found."
else
	echo "Java File not found."
	#can download
fi
sudo tar zxvf java.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/vagrant_data/jdk1.8.0_45/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac /opt/vagrant_data/jdk1.8.0_45/bin/javac 100
java -version
echo "Finished Java"


if [ -f "/opt/vagrant_data/maven.tar.gz"]
then
	echo "Maven File found."
else
	echo "Maven File not found."
	#can download
fi
sudo tar zxvf maven.tar.gz
sudo update-alternatives --install /usr/bin/mvn mvn /opt/vagrant_data/apache-maven-3.3.9/bin/mvn 100
mvn -version
echo "Finished Maven"


if [ -f "/opt/vagrant_data/jira.bin"]
then
	echo "Jira File found."
else
	echo "Jira File not found."
	#can download
fi
sudo chmod a+x jira.bin
./jira.bin << EOF
o
1
2
8081
8006
i
EOF

sudo chmod -R +rx /var/atlassian/application-data/

echo "Finished Jira"


#sudo tar zxvf nexus-3.0.2-02-unix.tar.gz

echo "Everything is done"

