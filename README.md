### INSTRUCTIONS ###
1. Clone this repository
2. Copy `.env.example` to `.env` and fill in the required variables:
  - `SERVER_NAME`: Name of your Zomboid server
  - `ADMIN_USERNAME`: Admin account username
  - `ADMIN_PASSWORD`: Admin account password
  - `INSTALL_DIR`: Path where the server will be installed (e.g., `/home/steam/ZomboidDedicatedServer`)
  - `PERSISTENCE_STORAGE`: Path for persistent game data (e.g., `./zomboid-data`)
3. Run `docker-compose up -d` to start the server
4. Check logs with `docker-compose logs -f pz-server`
5. Stop the server with `docker-compose down`