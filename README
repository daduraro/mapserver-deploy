# Mapserver deploy

This repository has all the necessary scripts to build (using docker) the mapserver and a `docker-compose.yml` template file to setup a docker container with the mapserver and nginx reverse proxy.

## Building the Docker image

```bash
# build image and export to build
mkdir build
docker build -t daduraro/mapserver:latest -o type=tar,dest=build/mapserver.tar .
```

## Setting up the image using docker-compose

Environment variables for docker-compose (can be added with a .env file):
  - DC_NGINX_CERTS_MOUNT: certs volume to mount with mapserver.crt and mapserver.key certificates.
  - DC_NGINX_PROXY_CONF_MOUNT: path to a configure file for nginx-proxy.
  - DC_MAPSERVER_VIRTUAL_HOST: refer to nginx-proxy VIRTUAL_HOST variable.
  - DC_MAPSERVER_DATA_MOUNT: directory where map.db and maps/* are expected.

# Disclaimer

This is a very early-stage pet project. It can (and will) contain critical security issues.