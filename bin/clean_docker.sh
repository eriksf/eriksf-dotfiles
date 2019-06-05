#!/usr/bin/env bash

EXITED_CONTAINERS=$(docker ps -q -f 'status=exited')
DANGLING_IMAGES=$(docker images -q -f 'dangling=true')

if [ ! -z "${EXITED_CONTAINERS}" ]
then
    docker rm ${EXITED_CONTAINERS}
fi

if [ ! -z "${DANGLING_IMAGES}" ]
then
    docker rmi ${DANGLING_IMAGES}
fi
