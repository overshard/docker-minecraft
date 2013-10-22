# -----------------------------------------------------------------------------
# docker-minecraft
#
# Builds a basic docker image that can run a Minecraft server
# (http://minecraft.net/).
#
# Authors: Isaac Bythewood
# Updated: Oct 21st, 2014
# Require: Docker (http://www.docker.io/)
# -----------------------------------------------------------------------------


# Base system is the LTS version of Ubuntu.
from   ubuntu:12.04


# Make sure we don't get notifications we can't answer during building.
env    DEBIAN_FRONTEND noninteractive


# An annoying error message keeps appearing unless you do this.
run    dpkg-divert --local --rename --add /sbin/initctl
run    ln -s /bin/true /sbin/initctl


# Download and install everything from the repos.
add    ./apt/sources.list /etc/apt/sources.list
run    apt-get --yes update; apt-get --yes upgrade
run	   apt-get --yes install curl openjdk-7-jre-headless supervisor pwgen



# Load in all of our config files.
add    ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf
add    ./supervisor/conf.d/minecraft.conf /etc/supervisor/conf.d/minecraft.conf
add    ./minecraft/ops.txt /usr/local/etc/minecraft/ops.txt
add    ./minecraft/white-list.txt /usr/local/etc/minecraft/white-list.txt
add    ./minecraft/server.properties /usr/local/etc/minecraft/server.properties
add    ./scripts/start /start


# Fix all permissions
run	   chmod +x /start


# 80 is for nginx web, /data contains static files and database /start runs it.
expose 25565
volume ["/data"]
cmd    ["/start"]

