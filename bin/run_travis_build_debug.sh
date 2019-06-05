#!/bin/sh

id=$1
token="XjMmkOt4-Yie0SwaWlxavQ"

echo "Running debug for travis ci build #${id}..."
curl -v -s -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "Travis-API-Version: 3" -H "Authorization: token ${token}" -d "{\"quiet\": true}" https://api.travis-ci.org/job/${id}/debug
