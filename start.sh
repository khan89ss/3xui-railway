#!/bin/bash
set -x

export PORT="${PORT:-8080}"
echo "PORT is: $PORT"

envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
echo "nginx config generated"
cat /etc/nginx/nginx.conf

nginx &
echo "nginx started"

cd /app
./DockerEntrypoint.sh &
echo "x-ui entrypoint launched"

wait -n
