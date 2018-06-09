#!/bin/sh

set -ex

cd data/

# Remove previous serveur version if it exists
rm -rf minecraft_server.*.jar

# Move minecrafst server jar in the data folder
cp ../minecraft_server.${MINECRAFT_VERSION}.jar .

# Create eula file to be able to start the server
echo "eula=true" > eula.txt

# Let's play now !
java -Xmx2G -jar minecraft_server.${MINECRAFT_VERSION}.jar nogui