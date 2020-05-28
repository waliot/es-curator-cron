# Elasticsearch Curator Cron

Elasticsearch Curator indices retention cron job.

It supports Elasticsearch 7.x version.

Elasticsearch Curator [documentation](https://www.elastic.co/guide/en/elasticsearch/client/curator/5.8/index.html).

Elasticsearch Curator [repository](https://github.com/elastic/curator).

You can set the cron `PERIOD` to `15min`, `hourly`, `daily`, `weekly` and `monthly`.

## Build Docker image

```bash
$ docker build -t binakot/es-curator-cron .
```

## Run in Docker

Run in single container:

```bash
$ docker run \
    --name curator \
    -e PERIOD="hourly" \
    -e KEEP_DAYS="30" \
    -e INDEX_PREFIX="logstash" \
    -e INDEX_PATTERN="[prefix-]%Y.%m.%d" \
    -d binakot/es-curator-cron:latest \
    "--host elasticsearch --port 9200"
```

Service in `Docker Compose` or `Docker Swarm` stack:

```yaml
version: '3.4'

services:
  curator:
    image: binakot/es-curator-cron:latest
    environment:
      - PERIOD: 'hourly'
      - KEEP_DAYS: '30'
      - INDEX_PREFIX: 'logstash'
      - INDEX_PATTERN: '[prefix-]%Y.%m.%d'
    command: '--host elasticsearch --port 9200'
```

---

Based on [https://github.com/stefanprodan/es-curator-cron](https://github.com/stefanprodan/es-curator-cron).

Forked from [https://github.com/LexPredict/es-curator-cron](https://github.com/LexPredict/es-curator-cron).
