#!/bin/bash
set -e

IMAGE="quiddia/docker-jenkins-master:1.625.1_1.8.3"
NAME="jenkins_master"
JENKINS_HOME="/tmp/jenkins_home"

# This is a showcase setup - do it from scratch always when this script is run -> Ansible decides
docker rm -f $NAME || :
rm -rf ${JENKINS_HOME} || :

# Correct permissions just in case
mkdir $JENKINS_HOME && chmod 777 $JENKINS_HOME
chmod 755 scripts scripts/*.sh

echo "Creating Jenkins Container..."
docker run --name ${NAME} \
-v `pwd`/scripts/:/tmp/scripts \
-v $JENKINS_HOME:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-d -p 40000:40000 -p 8080:8080 ${IMAGE}

# echo "Installing plugins"
# docker exec -it ${NAME} /tmp/scripts/install_plugins.sh
# Moved to config.tar
sleep 5

echo "Preconfigure instance..."
docker exec ${NAME} tar -C /var/jenkins_home -xf /tmp/scripts/config.tar

echo "Restarting Jenkins"
docker restart ${NAME}
