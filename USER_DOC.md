**This is a User documantation on how to work with this project**

1. Services provided by the stack are:
	- Mariadb an open source database software for saving data related to other services (users, passwords, configs, sites...)
	- Wordpress for building websites and managing content without needing to code.
	- Nginx the web server for hosting the website.

2. Start and stop the project:
	- Before starting the project make sure u have make and docker
		~$ make -v
		~$ docker -v
	- To build and start the project run make up from the root directory of the project
		~$ cd /inception
		~/inception$ make up
	- You can safely shut down all containers with make down
		~/inception$ make down
	- Restart all services
		~/inception make restart
	- Rebuild the project (needed if u made changes in code)
		~/inception make re
	- Delete all containers and images
		~/inception make fclean

3. Check all services:
	- u can check all the running services by typing this command
		~/inception$ docker ps
	- check built up images
		~/inception$ docker images
	- for logs checking
		~/inception$ docker logs <service_name>
	- check binded volumes
		~/inception$ docker volume ls

4. How to access Website and the administration panel:
	- once all containers are running open the browser and try navigating to the website by typing the local host ip address https://127.0.0.1/ or domain name https://hlachhab.42.fr/
	- to access the admin panel go to https://127.0.0.1/wp-admin or https://hlachhab.42.fr/wp-admin


5. Locating credentials:
	- All the sensitive credentials are stored as enviroment variables in .env
__example enviroment file__
ADMIN_USER=superuser
ADMIN_PWD=password
ADMIN_EMAIL=email@email.email

