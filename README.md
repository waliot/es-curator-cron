# es-curator-cron

Elasticsearch v7 Curator Logstash indices retention cron job
based on: https://github.com/stefanprodan/es-curator-cron


### Run

Docker Swarm stack:

```yaml
version: "3.7"

services:
  curator:
    image: lexpredict/es-curator-cron:latest
    environment:
      - "PERIOD=15min"
      - "KEEP_DAYS=30"
      - "INDEX_PREFIX=logstash"
    command: "--host elasticsearch --port 9200"
```

You can set the cron `PERIOD` to 15min, hourly, daily, weekly and monthly.

The default index pattern is `[prefix-]%Y.%m.%d`.
