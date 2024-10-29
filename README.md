# modular-dockers
This project aims to containerize the key components commonly used in our application development workflows to streamline and accelerate the deployment process.

These `docker-compose` files also serve as development templates and "study guides," as they include comments and annotations explaining the functionality of key components within a `docker-compose` setup. This documentation offers a structured approach to understanding the files and components, enhancing both learning and practical use.

The recommended reading order is as follows:

1. **Postgres**
2. **Mongo**
3. **Mosquitto**

### Environment Files

The `.env` files are excluded in the `.gitignore` to prevent sensitive information from being committed. However, if `.env` files are required, `.env.example` files are available to use them as models.

## Usage Instructions

### To run any of the components/containers:

```shell
docker-compose up
```

Or, to start them in detached mode:

```shell
docker-compose up -d
```

### To stop the containers:

To shut down all running containers:

```shell
docker-compose down
```

These components are typically run on an Ubuntu server or virtual machine, providing a consistent and reliable environment across deployments.

### To install Docker on Ubuntu, execute:

```shell
./installDockerUbuntu.sh
```

