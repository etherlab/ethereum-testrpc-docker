# ethereum-testrpc-docker
No pain no gain, I put it here after 2 hours (no,  4) of pain on Microsoft Windows to make it works.

# Description 
A dockerfile ready to use in Microsoft Windows with Testrpc for Ethereum.

* Get the [Dockerfile](dockerfile) and put it on a clean folder with all your other containers.
* Open Docker Quickstart Terminal
* build the Dockerfile ``` docker build -t testrpc ``` 
* Normally, all must be okay. If not, docker is really verbose so it will pop you what was wrong.
* You can try to launch testrpc like this ``` docker run -t -i -p 8545:8545 testrpc ````  but you don't have the local ip of this newly created Provider.

So we'll get the IP.

In Windows Cmd, get the list of your docker containers

```` 
"C:\Program Files\Docker Toolbox\docker-machine" ls
````

You will have these lines, just note your container's name (_YOUR_CONTAINER_) and IP address.

````
NAME      ACTIVE   URL          STATE     URL                         SWARM   DOCKER   ERRORS
YOUR_CONTAINER   -        virtualbox   Running   tcp://192.168.99.100:2376           v1.9.1
````

Back in Docker CMD, launch docker with 

``` docker run -t -i -p 8545:8545 testrpc ````  

You can use your containers ip to map your dapp with the testrpc container.


Example in javascript with web3.js

````javascript

if(typeof web3 !== 'undefined')
  web3 = new Web3(web3.currentProvider);
else
  web3 = new Web3(new Web3.providers.HttpProvider("http://192.168.99.100:8545"));

if(!web3.isConnected()) {
	console.log("prout :'(");
} else {
	console.log('Pas prout :D');
}
````

## For additionnal waw sexy such fun 

After that, type this following line and replace YOUR_CONTAINER by the one provided in the previous response.

```` 
"C:\Program Files\Docker Toolbox\docker-machine" env YOUR_CONTAINER --shell=cmd
````

Docker-machine will answer you with some useful infos (IP of your container, and the last 2 lines, so put )

```` 
SET DOCKER_TLS_VERIFY=1
SET DOCKER_HOST=tcp://192.168.99.100:2376
SET DOCKER_CERT_PATH=C:\Users\onlyyou\.docker\machine\machines\default
SET DOCKER_MACHINE_NAME=default
REM Run this command to configure your shell:
REM     FOR /f "tokens=*" %i IN ('"C:\Program Files\Docker Toolbox\docker-machine" env YOUR_CONTAINER --shell=cmd') DO %i 
````

Copy paste and run this last line as needed, don't forget to replace YOUR_CONTAINER

````
REM     FOR /f "tokens=*" %i IN ('"C:\Program Files\Docker Toolbox\docker-machine" env YOUR_CONTAINER --shell=cmd') DO %i 
````

