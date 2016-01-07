# Automated Docker build for MySQL

* Based on/uses the official [Debian Docker image](https://hub.docker.com/_/debian/).
* Configures default global credentials: root/mysql

## Creating an Image

```bash
docker build -t mysql:latest .
```

## Creating a Container

```bash
docker run -d --name mysql -p 0.0.0.0:4306:3306 mysql:latest
```
