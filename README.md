**This project has been created as part of the 42 curriculum by hlachhab**


# Description
	Inception is a good introduction to docker and containerization, its a good way to learn how you can setup docker images from scratch depending on each service, these services include a database (mariadb) to save data, wordpress for managing dynamic content and compiling php files and lastely nginx a web server that let you host your website and can serve static files. Each of these services are running on a different isolated container so the goal is to understand how to manage and connect these services together with docker so u can simulate a real world production enviroment for a web server.


	How u can make this work ?

	We have to dive in docker world and what does it actually solve for us, its not like we cant build an application without docker properties but it makes it easier for the application to run on different operating systems with the same dependencies used to install the services u just need docker installed and u can run it basically anywhere, the secret for this is docker containers and docker images, let me explain.

	Think of containers like virtual machines but instead of simulating the hardware and the OS for each container, containers use the actual hardware for the host machine so it simulates only the software this save us some space and time when launching and using the container.

## Docker File:
	Docker file is used to create a docker image, basically you run bunch of instrunctions that considered layers of commands related to what service you want to install and configure on that container thats gonna be used by docker engine to automatically build a docker image, like what base system you wanna build ur software on and what kind of tools u wanna install and the entrypoint to your system (first thing that runs after installation faze).

## Docker image
	A docker image is an instance or blueprint for a container, it includes all the dependencies and requirement for ur container to run, once you have a built up image you just need to run it and the container will be running based on that image.

## Container
	Container is just a running process in our host machine and its managed by docker by tracking the first process on that container whish is PID1 so its very important we have our services on each container
	living on PID1 so docker can track every running service.


## Docker Compose:
	(docker-compose.yaml)

	Docker compose is a tool used to run multiple containers at the same time using commands that can build, run, stop, remove, restart all containers at the same time.

## Usage	
	+ Docker network that make a virtual local network allowing the possiblity for containers to find with each other just by service names without exposing port to the host machine.

	+ Docker volumes that let u save data on ur host machine while containers can access it instead of losing data because containers data gets deleted every time it stops (docker compose down) so the volumes option make data persist.

	+ Docker enviroments or secrets are used to pass sensitive data to the containers instead of hardcoding configuration values (users, passwords...) in the code itself u can just create enviroment variables or docker secrets to manage those key values.

	+ Docker services basically define the container name and the build (docker image) directory and add any necessary options for the service to run.

<!-- ## Resources -->

## Some Usefull References
	- Docker documentation https://docs.docker.com/get-started/docker-overview/
	- Docker Compose documentation https://www.geeksforgeeks.org/devops/docker-compose/
	- Nginx official documentation https://nginx.org/
	- Mariadb Docs https://mariadb.com/docs
	- Wordpress https://wordpress.org/documentation/article/get-started-with-wordpress/

## AI Usage
	AI was used to:
		- Clarify how docker manages containers and how does it work
		- Validate configuration and services logic
		- Making sure i was on right track
		- Help understand more about the project

<!-- ## Technical Choices -->

### Virtual Machines vs Docker
	Virtual machines emulate the hardware and the OS, making them heavier and slower.
	Docker containers share the host kernel and emulate only the OS, making them lighter and faster to start.

### Secrets vs Environment Variables
	Secrets are stored securely by Docker and not exposed in images or logs.
	Environment variables are easier to use but less secure.

### Docker Network vs Host Network
	Docker networks provide container isolation and internal DNS resolution.
	Host networking removes isolation and is not recommended for production.

### Docker Volumes vs Bind Mounts
	Volumes are created and managed by Docker and are portable.
	Bind mounts depend on host paths and are harder to manage across systems.

__check DEV_DOC.md and USER_DOC.md form more information about building the project__
