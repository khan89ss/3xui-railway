FROM ghcr.io/mhsanaei/3x-ui:latest

RUN apk add --no-cache nginx gettext bash

COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start.sh /start.sh
RUN sed -i 's/\r$//' /start.sh && chmod +x /start.sh

RUN find / -iname "x-ui*" -type f 2>/dev/null || true
EXPOSE 8080

ENTRYPOINT ["/bin/bash", "/start.sh"]
