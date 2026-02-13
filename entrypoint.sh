#!/bin/bash
set -e
echo "Starting ${SERVER_NAME:-ye} server Zomboid..."

# Admin stuff
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-pleasechangethankyou}"

# installation path
INSTALL_DIR="${INSTALL_DIR:-/home/steam/ZomboidDedicatedServer}"

/home/steam/Steam/steamcmd.sh \
  +force_install_dir ${INSTALL_DIR} \
  +login anonymous \
  +app_update 380870 validate \
  +quit


cd ${INSTALL_DIR}
exec ./start-server.sh -servername "${SERVER_NAME}" -adminusername "${ADMIN_USERNAME}" -adminpassword "${ADMIN_PASSWORD}"