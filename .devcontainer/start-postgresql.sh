#!/usr/bin/env bash

# set -a

# : ${POSTGRES_USER:="admin"}
# : ${POSTGRES_PASSWORD:="admin"}
# : ${POSTGRES_DB:="mydb"}
# : ${POSTGRES_CONTAINER_NAME:="demo-db"}
# : ${HOST_VOLUME:=/home/vscode/isphere/db/}
# : ${CONTAINER_VOLUME:=/var/lib/postgresql/data}
# : ${PORT_NUMBER:=5432}
# : ${IMAGE_NAME:="demo-db"}

# # NOTE : Instead of mounting the volume directly to /var/lib/postgresql, mount it to another directory like /var/lib/postgresql/pgdata.	

# docker run \
#     -it \
#     --net=host \
#     --name=${POSTGRES_CONTAINER_NAME} \
#     --restart=unless-stopped \
#     -d \
#     -e POSTGRES_USER=${POSTGRES_USER} \
#     -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
#     -e POSTGRES_DB=${POSTGRES_DB} \
#     -p ${PORT_NUMBER}:${PORT_NUMBER} \
# 	postgres:16-bookworm
#     # ${IMAGE_NAME}

docker run \
    --rm \
    --net=host \
    --name=demo-db \
    -d \
    -e POSTGRES_USER=admin \
    -e POSTGRES_PASSWORD=admin \
    -e POSTGRES_DB=mydb \
    -p 5432:5432 \
	demo-db

# docker run --rm --net=host --name=demo-db -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=mydb demo-db
docker exec -it demo-db bash
