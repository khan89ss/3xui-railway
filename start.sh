#!/bin/bash
set -x

export PORT="${PORT:-8080}"
echo "PORT is: $PORT"

envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
echo "nginx config generated"

nginx &
echo "nginx started in background"

cd /app
echo "=== Current x-ui settings ==="
./x-ui setting -show true 2>&1 || true
echo "=== End settings ==="

exec ./DockerEntrypoint.sh
