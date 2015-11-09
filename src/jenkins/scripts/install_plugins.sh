#!/bin/sh
set -e

PLUGINDIR="/var/jenkins_home/plugins"

mkdir -p $PLUGINDIR && cd $PLUGINDIR

echo "Downloading plugins, be patient"

set -x

wget -q http://updates.jenkins-ci.org/latest/git-client.hpi
wget -q http://updates.jenkins-ci.org/latest/git.hpi
wget -q http://updates.jenkins-ci.org/latest/golang.hpi
wget -q http://updates.jenkins-ci.org/latest/delivery-pipeline-plugin.hpi
wget -q http://updates.jenkins-ci.org/latest/simple-theme-plugin.hpi
wget -q http://updates.jenkins-ci.org/latest/gravatar.hpi
wget -q http://updates.jenkins-ci.org/latest/durable-task.hpi
wget -q http://updates.jenkins-ci.org/latest/jquery.hpi
wget -q http://updates.jenkins-ci.org/latest/scm-api.hpi
wget -q http://updates.jenkins-ci.org/latest/token-macro.hpi
wget -q http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi
wget -q http://updates.jenkins-ci.org/latest/job-dsl.hpi
wget -q http://updates.jenkins-ci.org/latest/docker-build-step.hpi
wget -q http://updates.jenkins-ci.org/latest/authentication-tokens.hpi
wget -q http://updates.jenkins-ci.org/latest/docker-commons.hpi
wget -q http://updates.jenkins-ci.org/latest/credentials.hpi
wget -q http://updates.jenkins-ci.org/latest/rebuild.hpi
wget -q http://updates.jenkins-ci.org/latest/copyartifact.hpi

set +x

chown -R jenkins.jenkins $PLUGINDIR
