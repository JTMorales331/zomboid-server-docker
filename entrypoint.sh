#!/bin/bash
set -e
echo "Starting server Zomboid..."

/home/steam/Steam/steamcmd.sh \
  +force_install_dir /home/steam/ZomboidDedicatedServer \
  +login anonymous \
  +app_update 380870 validate \
  +quit


cd /home/steam/ZomboidDedicatedServer
exec ./start-server.sh -servername "GMAN" -adminusername "${ADMIN_USERNAME}" -adminpassword "${ADMIN_PASSWORD}"