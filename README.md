# Inception

---

## Description

Inception is a good introduction to Docker and containerization. It's a good way to learn how you can set up Docker images from scratch depending on each service. These services include:

- A database (**MariaDB**) to save data  
- **WordPress** for managing dynamic content and compiling PHP files  
- **Nginx**, a web server that lets you host your website and serve static files  

Each of these services runs in a different isolated container. The goal is to understand how to manage and connect these services together with Docker so you can simulate a real-world production environment for a web server.

---

## How can you make this work?

We have to dive into the Docker world and understand what it actually solves for us. It's not like we can't build an application without Docker, but it makes it easier for the application to run on different operating systems with the same dependencies used to install the services.

You just need Docker installed, and you can run it basically anywhere.

The secret behind this is **Docker containers** and **Docker images**.

Think of containers like virtual machines, but instead of simulating the hardware and the OS for each container, containers use the actual hardware of the host machine. They simulate only the software. This saves space and time when launching and using containers.

---

## Dockerfile

A **Dockerfile** is used to create a Docker image.

Basically, you run a bunch of instructions considered layers of commands related to the service you want to install and configure inside that container. Docker uses these instructions to automatically build a Docker image.

You define:

- The base system you want to build your software on  
- The tools you want to install  
- The entrypoint to your system (the first thing that runs after the installation phase)  

---

## Docker Image

A Docker image is a blueprint for a container.  

It includes all the dependencies and requirements for your container to run. Once you have a built image, you just need to run it, and the container will start based on that image.

---

## Container

A container is just a running process on your host machine.

It is managed by Docker by tracking the first process in that container, which is **PID 1**.  
It is very important that your main service runs as PID 1 so Docker can properly track and manage it.

---

## Docker Compose

**(docker-compose.yaml)**

Docker Compose is a tool used to run multiple containers at the same time using commands that can:

- Build  
- Run  
- Stop  
- Remove  
- Restart  

all containers together.

---

## Usage

- **Docker Network**  
  Creates a virtual local network allowing containers to find each other using service names without exposing ports to the host machine.

- **Docker Volumes**  
  Allow you to save data on your host machine while containers can access it.  
  Without volumes, container data gets deleted every time it stops (`docker compose down`).  
  Volumes make data persistent.

- **Docker Environments / Secrets**  
  Used to pass sensitive data to containers instead of hardcoding configuration values (users, passwords, etc.) in the code.  
  You can use environment variables or Docker secrets to manage these values.

- **Docker Services**  
  Define the container name, the build directory (Docker image), and any necessary options for the service to run.

---

## Some Useful References

- Docker documentation  
  https://docs.docker.com/get-started/docker-overview/

- Docker Compose documentation  
  https://www.geeksforgeeks.org/devops/docker-compose/

- Nginx official documentation  
  https://nginx.org/

- MariaDB Docs  
  https://mariadb.com/docs

- WordPress documentation  
  https://wordpress.org/documentation/article/get-started-with-wordpress/

---

## Technical Choices

### Virtual Machines vs Docker

Virtual machines emulate hardware and the OS, making them heavier and slower.  
Docker containers share the host kernel and emulate only the OS, making them lighter and faster to start.

---

### Secrets vs Environment Variables

Secrets are stored securely by Docker and not exposed in images or logs.  
Environment variables are easier to use but less secure.

---

### Docker Network vs Host Network

Docker networks provide container isolation and internal DNS resolution.  
Host networking removes isolation and is not recommended for production.

---

### Docker Volumes vs Bind Mounts

Volumes are created and managed by Docker and are portable.  
Bind mounts depend on host paths and are harder to manage across systems.

---

> **Check `DEV_DOC.md` and `USER_DOC.md` for more information about building the project.**
