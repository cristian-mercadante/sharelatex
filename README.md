# ShareLaTeX local installation
## Introduction
This tutorial has been tested for Ubuntu 18.04

## Setting up Docker
For further explanations visit [Docker documentation](https://docs.docker.com/install/linux/docker-ce/ubuntu/).
### Set up the repository
1. Update the apt package index:
`sudo apt-get update`
2. Install packages to allow apt to use a repository over HTTPS
`sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common`
3. Add Docker's official GPG key
`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
4. Verify that you now have the key with the fingerprint
`9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88`
by searching for the last 8 characters of the fingerprint
`sudo apt-key fingerprint 0EBFCD88`
Output should be:
`pub   4096R/0EBFCD88 2017-02-22
      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>
sub   4096R/F273FCD8 2017-02-22`
5. Set up the stable repository
`sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"`
### Install Docker CE
1. Install the latest version of Docker CE
`sudo apt-get install docker-ce`
2. Verify that Docker CE is installed correctly by running the _hello-world_ image
`sudo docker run hello-world`
