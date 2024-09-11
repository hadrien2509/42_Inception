# 42 Inception

![42](https://img.shields.io/badge/School-42-black?style=flat-square&logo=42)

## Project Overview

42 Inception is a project that aims to create a small infrastructure composed of different services running in Docker containers. The primary goal is to set up a WordPress website with a lightweight LEMP (Linux, Nginx, MariaDB, PHP) stack, ensuring proper volume management and data persistence.

This project provides a hands-on experience in working with Docker, Docker Compose, and containerization concepts. It covers various aspects of containerization, including building custom images, configuring services, managing volumes, and networking.

## Table of Contents

- [Project Overview](#project-overview)
- [How to Run the Project](#how-to-run-the-project)
- [Project Structure](#project-structure)
- [Main Features](#main-features)
- [Front-end Logic](#front-end-logic)
- [Back-end Logic](#back-end-logic)
- [Contribution Guidelines](#contribution-guidelines)
- [License](#license)
- [Additional Resources](#additional-resources)
- [Contact Information](#contact-information)

## How to Run the Project

To set up and run the 42 Inception project locally, follow these steps:

1. **Prerequisites**
   - Docker
   - Docker Compose

2. **Installation**
   - Clone the repository: `git clone https://github.com/your-username/42-inception.git`
   - Navigate to the project directory: `cd 42-inception`

3. **Configuration**
   - Create an `.env` file in the project root directory with the following environment variables:
     ```
     MYSQL_ROOT_PASSWORD=your_mysql_root_password
     MYSQL_DATABASE=your_mysql_database_name
     MYSQL_USER=your_mysql_user
     MYSQL_PASSWORD=your_mysql_password
     DOMAIN_NAME=your_domain_name
     WP_TITLE=your_wordpress_site_title
     WP_ROOT_USER=your_wordpress_admin_username
     WP_ROOT_PASSWORD=your_wordpress_admin_password
     WP_ROOT_EMAIL=your_wordpress_admin_email
     WP_USER=your_wordpress_author_username
     WP_USER_EMAIL=your_wordpress_author_email
     WP_USER_PASSWORD=your_wordpress_author_password
     ```

4. **Running the Project**
   - Build and start the containers: `docker-compose up --build`
   - The WordPress site should now be accessible at `https://your_domain_name`

5. **Testing**
   - To run tests (if applicable), execute the following command: `docker-compose run --rm service_name test`

6. **Stopping the Project**
   - Stop and remove the containers: `docker-compose down`

## Project Structure

```
/Volumes/Storage/goinfre/hgeissle/42_Inception
├── .git/
├── srcs/
│   ├── destroy.sh
│   ├── docker-compose.yml
│   ├── requirements/
│   │   ├── mariadb/
│   │   │   ├── conf/
│   │   │   └── tools/
│   │   │       └── database.sh
│   │   ├── nginx/
│   │   │   └── conf/
│   │   │       └── nginx.conf
│   │   └── wordpress/
│   │       └── conf/
│   │           ├── wordpress.sh
│   │           └── www.conf
```

- `.git/`: Git repository metadata.
- `srcs/`: Contains the source files and configurations.
  - `destroy.sh`: A script to stop and remove all containers, images, volumes, and networks.
  - `docker-compose.yml`: The Docker Compose configuration file that defines the services and their relationships.
  - `requirements/`: Directory containing service-specific configurations and scripts.
    - `mariadb/`: MariaDB service configurations and scripts.
      - `conf/`: Directory for MariaDB configuration files.
      - `tools/database.sh`: A script to initialize the MariaDB database.
    - `nginx/`: Nginx service configurations.
      - `conf/nginx.conf`: The Nginx configuration file.
    - `wordpress/`: WordPress service configurations and scripts.
      - `conf/wordpress.sh`: A script to configure and install WordPress.
      - `conf/www.conf`: The PHP-FPM configuration file for WordPress.

## Main Features

- **Docker Containerization**: The project leverages Docker containers to encapsulate and run each service (Nginx, MariaDB, WordPress) independently.
- **Docker Compose**: Docker Compose is used to define and orchestrate the multi-container application, managing the services' dependencies and configurations.
- **Custom Docker Images**: Custom Docker images are built for each service, allowing for specific configurations and optimizations.
- **Volume Management**: Persistent data storage is achieved through the use of Docker volumes, ensuring data persistence across container restarts.
- **Networking**: The services are connected via a Docker network, enabling seamless communication between them.
- **Environment Configuration**: Environment variables are used to configure various aspects of the services, such as database credentials, WordPress settings, and domain names.
- **SSL/TLS Encryption**: The Nginx service is configured to serve the WordPress site over HTTPS, providing secure communication.

## Front-end Logic

The front-end of the WordPress website is served by the Nginx service, which acts as a reverse proxy. Nginx is responsible for handling incoming requests, serving static content, and forwarding PHP requests to the PHP-FPM process running within the WordPress container.

The `srcs/requirements/nginx/conf/nginx.conf` file contains the Nginx configuration, including settings for SSL/TLS encryption, server name, root directory, and location blocks for handling different types of requests (static files, PHP files, etc.).

## Back-end Logic

The back-end of the project consists of the following components:

1. **MariaDB**
   - The MariaDB service provides the database for storing WordPress data, including posts, comments, and user information.
   - The `srcs/requirements/mariadb/tools/database.sh` script initializes the database and creates the necessary user and privileges.

2. **WordPress**
   - The WordPress service runs the PHP application and serves the WordPress website.
   - The `srcs/requirements/wordpress/conf/wordpress.sh` script configures and installs WordPress, creating the necessary database tables and setting up the initial admin user and author user.
   - The `srcs/requirements/wordpress/conf/www.conf` file configures the PHP-FPM process for handling PHP requests within the WordPress container.

The data flow between the services is as follows:

1. Nginx receives incoming requests and forwards PHP requests to the WordPress container.
2. The WordPress container processes the PHP code and interacts with the MariaDB service for database operations.
3. MariaDB stores and retrieves data as requested by the WordPress application.
4. Nginx serves the generated content back to the client.

## Contribution Guidelines

If you would like to contribute to this project, please follow these guidelines:

1. Fork the repository and create a new branch for your feature or bug fix.
2. Make your changes and ensure they are well-tested.
3. Commit your changes with descriptive commit messages.
4. Push your changes to your forked repository.
5. Submit a pull request to the main repository, describing the changes you've made and their purpose.

Please ensure that your code adheres to the project's coding standards and best practices.

## License

This project is licensed under the [MIT License](LICENSE).

## Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [WordPress Codex](https://codex.wordpress.org/)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [MariaDB Documentation](https://mariadb.com/kb/en/documentation/)

## Contact Information

If you have any questions, issues, or need further assistance, please feel free to reach out:

- Email: [your-email@example.com](mailto:your-email@example.com)
- GitHub: [https://github.com/your-username](https://github.com/your-username)