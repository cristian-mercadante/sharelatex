# ShareLaTeX local installation
## Introduction
This tutorial has been tested for Ubuntu 18.04


## Set up Docker
For further explanations visit [Docker documentation](https://docs.docker.com/install/linux/docker-ce/ubuntu/).

### Set up the repository
1. Update the apt package index
```
sudo apt-get update
```
2. Install packages to allow apt to use a repository over HTTPS
```
sudo apt-get install -y\
apt-transport-https \
ca-certificates \
curl \
software-properties-common
```
3. Add Docker's official GPG key
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
4. Verify that you now have the key with the fingerprint
```
9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
```
by searching for the last 8 characters of the fingerprint
```
sudo apt-key fingerprint 0EBFCD88
```
Output should be:
```
pub   4096R/0EBFCD88 2017-02-22
Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>
sub   4096R/F273FCD8 2017-02-22
```
5. Set up the stable repository
```
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
```

### Install Docker CE
1. Install the latest version of Docker CE
```
sudo apt-get install -y docker-ce
```
2. Verify that Docker CE is installed correctly by running the _hello-world_ image
```
sudo docker run hello-world
```


## Set up MongoDB and Redis
1. Installation
```
sudo apt-get install -y mongodb
sudo apt-get install -y redis-server
```
2. Configure MongoDB
```
sudo vim /etc/mongodb.conf
```
Modify: `bind_ip = 172.17.0.1`  

3. Configure Redis
```
sudo vim /etc/redis/redis.conf
```
Modify: `bind 172.17.0.1`  

4. Restart services
```
sudo service mongodb restart
sudo service redis-server restart
```

## Set up ShareLaTeX
1. Pull down the latest version of ShareLaTeX  
```
sudo docker pull sharelatex/sharelatex
```
2. DOCKER COMPOSE (CONTINUE)


## Run ShareLaTeX
1. Start up the container  
```
sudo docker run -d -v ~/sharelatex_data:/var/lib/sharelatex -p 80:80 --name=sharelatex --env SHARELATEX_SITE_URL=$domain --env SHARELATEX_APP_NAME=LaTeX sharelatex/sharelatex
```
2. Create new user (in this example, _joe@example.com_ is our username)  
```
sudo docker exec sharelatex /bin/bash -c "cd /var/www/sharelatex/web; grunt create-admin-user --email joe@example.com"
```
3. Click on the link on the output of previous command to set up the password

