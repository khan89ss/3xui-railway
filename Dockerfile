FROM ghcr.io/mhsanaei/3x-ui:latest

RUN apk add --no-cache nginx gettext bash

COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

ENTRYPOINT ["/start.sh"]
