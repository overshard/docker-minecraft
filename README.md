# docker-minecraft

A nice and easy way to get a Minecraft server up and running using docker. For
help on getting started with docker see the [official getting started guide][0].
For more information on Minecraft and check out it's [website][1].


## Building docker-minecraft

Running this will build you a docker image with the latest version of both
docker-minecraft and Minecraft itself.

    git clone https://github.com/overshard/docker-minecraft
    cd docker-minecraft
    sudo docker build -t overshard/minecraft .


## Running docker-minecraft

Running the first time will set your port to a static port of your choice so
that you can easily map a proxy to. If this is the only thing running on your
system you can map the port to 25565 and no proxy is needed. i.e.
`-p=25565:25565` . If you want to enable the query protocol you need
to add another -p=25565:25565/udp to forward the UDP protocol on the
same port as well.
Also be sure your mounted directory on your host machine is
already created before running `mkdir -p /mnt/minecraft`.

    sudo docker run -d=true -p=25565:25565 -v=/mnt/minecraft:/data overshard/minecraft /start

From now on when you start/stop docker-minecraft you should use the container id
with the following commands. To get your container id, after you initial run
type `sudo docker ps` and it will show up on the left side followed by the
image name which is `overshard/minecraft:latest`.

    sudo docker start <container_id>
    sudo docker stop <container_id>


### Notes on the run command

 + `-v` is the volume you are mounting `-v=host_dir:docker_dir`
 + `overshard/minecraft` is simply what I called my docker build of this image
 + `-d=true` allows this to run cleanly as a daemon, remove for debugging
 + `-p` is the port it connects to, `-p=host_port:docker_port`

## Connecting to the minecraft server console

To do this in a convenient way you should install a application called
[nsenter][3] and some convenient helper scripts.
If you want to install nsenter to your /usr/local/bin, just do this:

    docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter

This will actually create a docker machine for you where the command is 
being built. If that sounds to scary read the instructions on the webpage.

After installing you will have a script called docker-enter that uses
nsenter which lets you connect to a live container and run commands. 
Since we are using supervisor to run the server we will connect to 
supervisorctl and from there do whats needed like restarting, 
connecting to the shell etc.

To use docker-enter you will need the name of the container.

    sudo docker-enter my_awesome_container supervisorctl

Now you will be able to control the supervisor process that is previously
defined and called minecraft.

To connect to the shell of the server just type.

    fg minecraft

Now you are able to control the server just like normally.
When you are done, just press Ctrl+c to send it to the background again.

To disconnect from supervisorctl just type `exit` and press enter.
Now you are disconnected from the container as well.



[0]: http://www.docker.io/gettingstarted/
[1]: http://minecraft.net/
[3]: https://github.com/jpetazzo/nsenter

