FROM andarius/nginx-upload:1.22-alpine

RUN apk --update --no-cache add python3 py3-pip \
    && pip3 install bottle \
    && pip3 install shutilwhich \
    && mkdir -p /nginx/tmp \
    && cd /nginx/tmp && mkdir 0 1 2 3 4 5 6 7 8 9 && cd / \
    && mkdir -p /nginx/share \
    && mkdir -p /nginx/pages \
    && chown nginx:nginx -R /nginx

COPY ./nginx/nginx.conf         /etc/nginx/nginx.conf
COPY ./nginx/passwords          /etc/nginx/passwords
COPY ./nginx/conf.d/            /etc/nginx/conf.d/
COPY ./pages/                   /nginx/pages/
COPY ./rename.py                /
COPY ./docker-entrypoint.sh     /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh
