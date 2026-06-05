*This project has been created as part of the 42 curriculum by ryomori.*

## Description
This project aims to broaden the knowledge of system administration by using Docker. It involves setting up a small infrastructure composed of different services under specific rules within a virtual machine. The infrastructure consists of NGINX, WordPress, and MariaDB, each running in a dedicated container.

### Design Choices & Docker Usage
- **Base Image:** Alpine Linux 3.19 is used for all containers due to its lightweight nature, simplicity, and security features.
- **NGINX:** Acts as the sole entrypoint into the infrastructure via port 443, enforcing secure connections using TLSv1.2 and TLSv1.3.
- **WordPress:** Runs with PHP-FPM (PHP 8.3) to process dynamic content efficiently without a built-in web server.
- **MariaDB:** Securely stores the WordPress database in a completely isolated container.

### Technical Comparisons
- **Virtual Machines vs Docker:** Virtual Machines virtualize the hardware stack and require a full guest Operating System, making them resource-heavy and slower to start. Docker virtualizes at the OS level (using containers), sharing the host's kernel. This makes Docker containers significantly more lightweight, faster to deploy, and highly portable.
- **Secrets vs Environment Variables:** Environment variables are often stored in plain text files (e.g., `.env`) and can be exposed via process inspection or misconfigured repositories. Docker Secrets offer a more secure approach by encrypting sensitive data and mounting it directly into a container's temporary filesystem (tmpfs) in memory, ensuring it is never written to disk.
- **Docker Network vs Host Network:** The Host network binds a container directly to the host machine's network interfaces, eliminating network isolation and potentially causing port conflicts. Docker Networks (such as the custom bridge network used in this project) isolate container communication, provide automatic DNS resolution between containers (e.g., WordPress connecting to `mariadb` by name), and significantly enhance security by hiding internal ports from the outside world.
- **Docker Volumes vs Bind Mounts:** Bind mounts map an absolute host path directly to a container directory, which makes them highly dependent on the host's specific filesystem structure. Docker Volumes are managed entirely by the Docker daemon within a specific storage directory, offering better performance, portability, and safer data persistence across different environments. (Note: To comply with subject constraints, this project uses local driver volumes configured with `driver_opts` to behave similarly to bind mounts mapping to `/home/ryomori/data`).

## Instructions
1. Ensure Docker and Docker Compose are properly installed on your Virtual Machine.
2. Edit your `/etc/hosts` file (requires sudo) to map the domain to your local IP: 
   127.0.0.1 ryomori.42.fr
3. Configure your environment variables in `srcs/.env`. Make sure all required passwords and usernames are filled in.
4. From the root of the repository, build and start the infrastructure using the Makefile:
   make up

## Resources
- [Docker Official Documentation](https://docs.docker.com/)
- [NGINX Documentation](https://nginx.org/en/docs/)
- [Alpine Linux Packages](https://pkgs.alpinelinux.org/packages)
- **AI Usage:** Generative AI was utilized to draft the markdown document layouts, refine the English text for README, USER_DOC, and DEV_DOC to ensure clarity, and to correctly structure the technical comparisons required by the subject.
