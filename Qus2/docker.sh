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
sudo apt-get update -y
sudo apt-get -y install docker.io
# add current user to docker group so there is no need to use sudo when running docker
}

elastic_search () 
{
sudo docker run  -d -p 9200:9200 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.4.2
curl http://localhost:9200
}

prerequisite
elastic_search