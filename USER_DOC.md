# User Documentation

## Services Provided by the Stack
This infrastructure provides a fully functional, self-hosted WordPress website running over a secure HTTPS connection.
- **NGINX:** The web server that handles secure incoming connections (HTTPS) and serves the website directly to users.
- **WordPress:** The Content Management System (CMS) interface where you can publish articles, manage media, and customize the site.
- **MariaDB:** The database backend that securely stores all WordPress configurations, posts, and user information.

## Starting and Stopping the Project
- **To Start:** Open a terminal in the root directory of the project and run the following command:
  make up
  This command will automatically set up the required data folders and start all services in the background.
  
- **To Stop:** Navigate to the srcs directory where the docker-compose.yml file is located, and run:
  cd srcs
  docker compose down

## Accessing the Website and Administration Panel
- **Website:** Open your web browser and navigate to https://ryomori.42.fr . 
  *(Note: Because the SSL certificate is self-signed, your browser may display a security warning. You will need to explicitly accept the risk/proceed to view the site).*
- **Administration Panel:** Navigate to https://ryomori.42.fr/wp-admin . Use the Administrator credentials defined during setup to log in.

## Locating and Managing Credentials
All system credentials (database passwords, admin user details, etc.) are managed centrally via environment variables.
- You can find or modify these credentials in the srcs/.env file.
- **SECURITY WARNING:** Never commit the .env file to a public Git repository. It should be explicitly ignored using a .gitignore file.

## Checking Service Status
To verify that all services are up and running correctly, execute the following command in your terminal:
docker ps
You should see three containers running (nginx, wordpress, mariadb), all indicating an "Up" status.
