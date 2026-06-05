# Developer Documentation

## Setting up the Environment
1. **Prerequisites:** A virtual machine running a Linux distribution (e.g., Debian), with Docker and Docker Compose installed.
2. **Domain Routing:** To test the application locally, append 127.0.0.1 ryomori.42.fr to the host machine's /etc/hosts file.
3. **Configuration & Secrets:** 
   - Ensure the directory structure strictly follows the subject's requirements (srcs/requirements/...).
   - Create and populate the srcs/.env file. This file must contain all variables referenced in docker-compose.yml (such as DOMAIN_NAME, WP_DATA_PATH, MYSQL_ROOT_PASSWORD, etc.).

## Building and Launching
The project utilizes a Makefile at the repository root to streamline deployment.
- **Build and Launch:**
  make up
  This command executes two actions:
  1. Creates the necessary host directories for data persistence (/home/ryomori/data/wordpress and /home/ryomori/data/mariadb).
  2. Executes docker compose -f ./srcs/docker-compose.yml up --build to build the images and start the containers.

## Managing Containers and Volumes
Use the Docker CLI to interact with the environment for debugging and management:
- **View Container Logs:** docker logs <container_name> (e.g., docker logs wordpress)
- **Execute a Shell inside a Container:** docker exec -it <container_name> sh
- **List All Volumes:** docker volume ls
- **Inspect a Specific Volume:** docker volume inspect <volume_name>
- **Tear Down the Environment (including networks):** 
  cd srcs && docker compose down
- **Deep Clean (removes volumes and networks):**
  cd srcs && docker compose down -v

## Data Persistence Strategy
To prevent data loss when containers are stopped or removed, data is persisted on the host machine using Docker named volumes configured with a local driver.
- **Database Files:** Stored physically at /home/ryomori/data/mariadb . This path is mapped to the mariadb_vol volume in docker-compose.yml .
- **WordPress Files:** Stored physically at /home/ryomori/data/wordpress . This path is mapped to the wordpress_vol volume.
By using driver_opts: type: none, o: bind, the local named volumes bridge the gap between strict volume usage and specific host directory requirements mandated by the project subject.
