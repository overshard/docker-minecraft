# docker-minecraft

A nice and easy way to get a Minecraft server up and running using docker. For
help on getting started with docker see the [official getting started guide][0].
For more information on Minecraft and check out it's [website][1].

This repository is a fork from https://github.com/overshard/docker-minecraft

## Running
### Running this image with Docker-Compose

```
git clone https://github.com/nicemd/docker-minecraft
cd docker-minecraft
docker-compose up
```
Note you need docker-compose v1.21 or later.

### Running this image in a Docker Swarm
Only one swarm replica of the Minecraft server is supported.

```
git clone https://github.com/nicemd/docker-minecraft
cd docker-minecraft
docker stack deploy -c docker-compose.yml minecraft
```
## Minecraft Data directory

Your Minecraft world data will be placed in the `data` directory.


## Building docker image
```
docker build -t niemd/docker-minecraft .
docker tag niemd/docker-minecraft:latest niemd/docker-minecraft:1.12.2
```

Push it to Docker hub
```
docker push niemd/docker-minecraft:latest
docker push niemd/docker-minecraft:1.12.2
```


[0]: http://www.docker.io/gettingstarted/
[1]: http://minecraft.net/


