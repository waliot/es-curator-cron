FROM python:3.7-alpine3.7

LABEL elasticsearch-curator=5.8.1

RUN pip install elasticsearch-curator==5.8.1 && \
    rm -rf /var/cache/apk/*

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
