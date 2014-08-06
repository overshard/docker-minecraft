# -----------------------------------------------------------------------------
# docker-minecraft
#
# Builds a basic docker image that can run a Minecraft server
# (http://minecraft.net/).
#
# Authors: Isaac Bythewood
# Updated: Aug 6th, 2014
# Require: Docker (http://www.docker.io/)
# -----------------------------------------------------------------------------


# Base system is the LTS version of Ubuntu.
from   ubuntu:14.04


# Make sure we don't get notifications we can't answer during building.
env    DEBIAN_FRONTEND noninteractive


# Download and install everything from the repos.
run    apt-get --yes update; apt-get --yes upgrade
run	   apt-get --yes install curl openjdk-7-jre-headless supervisor


# Load in all of our config files.
add    ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf
add    ./supervisor/conf.d/minecraft.conf /etc/supervisor/conf.d/minecraft.conf
add    ./scripts/start /start


# Fix all permissions
run	   chmod +x /start


# 80 is for nginx web, /data contains static files and database /start runs it.
expose 25565
volume ["/data"]
cmd    ["/start"]
