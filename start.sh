#!/bin/bash
set -e

export PORT="${PORT:-8080}"
envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

nginx &

/app/x-ui &

wait -n
