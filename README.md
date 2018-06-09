Forked from https://github.com/overshard/docker-minecraft

See [original readme][0] for more information.

# Docker image

## For minecraft server 1.12
```docker pull gregoireweber/minecraft-server:latest```

```docker pull gregoireweber/minecraft-server:1.12```

## For minecraft server 1.11.2
```docker pull gregoireweber/minecraft-server:1.11.2```

# docker-minecraft

A nice and easy way to get a Minecraft server up and running using docker. For
help on getting started with docker see the [official getting started guide][1].
For more information on Minecraft and check out it's [website][2].

## Running docker-minecraft

To run a docker m inecraft usign this image simply type the following command :

```
docker run -d -p 25565:${EXPOSED_PORT} -v ${PATH_TO_YOUR_DATA_FOLDER}:/minecraft/data gregoireweber/minecraft-server:latest
```

Where

 - ```${PATH_TO_YOUR_DATA_FOLDER}``` is the absolute path to the folder that will hold the server data (whitelist, bannedip, config, etc...)
 - ```${EXPOSED_PORT}```is the port from wich you'll be able to reach the server (the default port for minecraft server is ``25565```)

[0]: https://github.com/overshard/docker-minecraft
[1]: http://www.docker.io/gettingstarted/
[2]: http://minecraft.net/
