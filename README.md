# devops-saints

## Requirements

* VirtualBox (current stable)
* Vagrant (tested with 1.7.4)
* Tested on Windows 10

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

*Note*

* in case private_network in Vagrantfile is used, you can access services with the designated IP
* otherwise the ports 7070 and 7080 should be mapped to 8080/tcp (Jenkins) and 80/tcp (Nginx) respectively

After the machine is provisioned via Vagrant and Ansible, and port forwarding (or private network works), go in the browser to:

http://localhost:7070/view/CD or http://192.168.200.200:8080/view/CD

and start a new Build. This will trigger Go compiler download and should build the project and start two Docker containers in the deployment step.
Then you should be able to access the app at:

http://localhost:7080 or http://192.168.200.200

Refreshing the page a number of times should show round robin behavior.

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
To test the entire workflow, Jenkins must be operational. A pre-defined config file is also part of this installation to eliminate manual steps.

## Repo Structure

```
.
├── bootstrap.sh                                <---- Bootstrap for provisioning Vagrant box for Ansible
├── README.md
├── src
│   ├── ansible
│   │   ├── hosts
│   │   ├── playbook.yml                        <---- Ansible playbook
│   │   └── roles                               <---- Ansible role definitions
│   │       ├── jenkins
│   │       └── nginx
│   └── jenkins
│       ├── jobs                                <---- DSL Jobs
│       ├── scripts
│       │   ├── config.tar                      <---- Jenkins Preconfiguration, including plugins, views and pre-configured jobs
│       │   └── install_plugins.sh
│       └── setup.sh                            <---- Jenkins bootstrap script
└── Vagrantfile                                 <---- Vagrant box configuration
```
## Technologies used

* Jenkins
* Docker
* Ansible
* Vagrant
* Go
* Nginx

## Known Issues

* There are known issues with private_network directive, VirtualBox and Windows 10 - Workaround: comment out that line and setup up networking manually
* There are known issues with Virtualbox >= 5.0 and Vagrant (see [here](https://www.virtualbox.org/ticket/14040))

