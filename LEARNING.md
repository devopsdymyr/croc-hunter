# Helm and CI/CD
## Here are the things that I'm learning and these are the commands:

Set the server and client boxes to install Jenkins Server and angent
```sh
$ sudo apt-get install openssh-server -y
$ sudo apt install curl
$ do-release-upgrade
```

```sh
$ sudo -H nano /etc/hostname ==> jenkins-server
$ sudo -H nano /etc/hosts  ==> jenkins-server
$ sudo /etc/init.d/networking restart
$ sudo service hostname start
$ sudo reboot -n


$ sudo -H nano /etc/hostname ==> jenkins-agent
$ sudo -H nano /etc/hosts  ==> jenkins-agent
$ sudo /etc/init.d/networking restart
$ sudo service hostname start
$ sudo reboot -n
```
Starting with the installation of Docker from a clean server and client machine.
We need to get Docker installed and to do that we need to get the details from this location: `https://get.docker.com/`


```sh
# $ sudo -s
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#set-up-the-repository
$ sudo apt-get update
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
$ sudo apt-get update
$ sudo apt install docker.io -y
$ sudo docker version	
$ sudo usermod -aG docker <your-name>
$ newgrp docker
$ docker ps
$ cd ~

```
Installing Jenkins on the server
```sh
$ cd ~
$ mkdir jenkins
cd jenkins
$ docker run --name jenkins-blue-ocean -d -p 8080:8080 -p 50000:50000 -v ~/jenkins:/var/jenkins_home --restart=always jenkins/jenkins:2.95
$ docker logs -f jenkins-blue-ocean
```
On the agent these need to be installed 
```sh 
$ sudo apt-get install -y openjdk-8-jdk
$ sudo -s
# mkdir -p /usr/local/jenkins
# cd /usr/local/jenkins
# wget https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.3/swarm-client-3.3.jar
# chmod +x swarm.sh
# 
```


To get Jenkins working need to get access to the `https://hub.docker.com/_/jenkins/` site and figure out what is the next step of the installation.

```sh
$ helm search
$ helm repo update
$ helm search jenkins
$ helm install --name jenkins stable/jenkins -f jenkins-values.yaml --namespace jenkins-blue
$ helm list
# 
$ kubectl get po -n jenkins-blue
$ kubectl get po -n crock-hunter
```

