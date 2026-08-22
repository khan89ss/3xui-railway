#!/bin/bash
set -x

export PORT="${PORT:-8080}"
echo "PORT is: $PORT"

envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
echo "nginx config generated"
cat /etc/nginx/nginx.conf

nginx &
echo "nginx started"

ls -la /app 2>&1
which x-ui 2>&1

/app/x-ui &
echo "x-ui launch attempted, exit code: $?"

wait -n
