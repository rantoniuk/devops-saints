# devops-saints

## Requirements

* VirtualBox (current stable)
* Vagrant (tested with 1.7.4)

## Starting up

* Clone GIT repository

```
git clone https://github.com/warden/devops-saints```
```

* start up ubuntu docker host

```
vagrant up
```

This should:

* Bring up Ubuntu box
* Download and install Ansible
* Provision the machine according to Ansible spec
* Start Jenkins instance

Next steps:

* in case private_network in Vagrantfile is uncommented - you can access services with the designated IP
* otherwise, see below for mapping ports manually

* Mapping ports manually - for Windows 10 *

* Map Virtualbox port 7080 to port 80 on guest - this is the application
* Map Virtualbox port 7070 to port 8080 on guest - this is Jenkins instance

## Architecture

* The application repository is here: https://github.com/warden/testapps
* The solution repository is here: https://github.com/warden/devops-saints
* Jenkins job definitions (DSLs) are here: https://github.com/warden/devops-saints/tree/master/src/jenkins/jobs
* DSL Job Definitions ensures that the Jenkins configuration can be easily controlled via DSL changes in GIT.
* Ansible spec ensures that the following are installed and running:
** Docker 
** Jenkins
** Nginx

In short:
The Ubuntu box serves as both, Jenkins Master server, Nginx Server that is the front Load Balancer and the Docker Host that is running the application itself.
To make it more interesting, Jenkins itself is dockerized. Jenkins is using customised images created by me and available [here](https://hub.docker.com/r/quiddia/docker-jenkins-master/).

To test the entire workflow, Jenkins must be operational. A pre-defined config file is also part of this installation to shorten the list of manual steps.






## Known Issues

* There are known issues with private_network directive, VirtualBox and Windows 10 - Workaround: comment out that line and setup up networking manually
* There are known issues with Virtualbox >= 5.0 and Vagrant (see [here](https://www.virtualbox.org/ticket/14040))

