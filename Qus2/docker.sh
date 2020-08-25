#!/bin/bash

prerequisite()
{
echo "Verifying Docker Package"
sudo apt install rpm -y
rpm -qa | grep docker &> /dev/null
if [ $? -eq 0 ]; 
then
    echo "Package  is installed!"
else
    docker_installation
fi
}

docker_installation () 
{
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main" 
sudo apt-get update
sudo apt-get -y install docker-engine 
# add current user to docker group so there is no need to use sudo when running docker
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker
sudo systemctl start docker
}

elastic_search () 
{
docker build -t elastic -f  /root/Dockerfile .
docker run -d -p 9200:9200 --name elasticserver elastic
docker exec elasticserver sed -i '/node.name/s/^#//g' /etc/elasticsearch/elasticsearch.yml
docker exec elasticserver sed -i '/bootstrap.memory_lock/s/^#//g' /etc/elasticsearch/elasticsearch.yml
docker exec elasticserver sed -i '/# network.host/ i network.host: 127.0.0.1' /etc/elasticsearch/elasticsearch.yml
docker exec elasticserver sed -i '/# network.host/ i network.publish_host: localhost' /etc/elasticsearch/elasticsearch.yml
docker exec elasticserver sed -i '/http.port/s/^#//g' /etc/elasticsearch/elasticsearch.yml
docker exec elasticserver service elasticsearch start
docker exec elasticserver service elasticsearch status
curl http://localhost:9200
}

prerequisite
elastic_search