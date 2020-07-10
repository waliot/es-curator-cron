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
    -e INDEX_PATTERN="logstash-%Y.%m.%d" \
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
      - INDEX_PATTERN: 'logstash-%Y.%m.%d'
    command: '--host elasticsearch --port 9200'
```

---

Based on [https://github.com/stefanprodan/es-curator-cron](https://github.com/stefanprodan/es-curator-cron).

Forked from [https://github.com/LexPredict/es-curator-cron](https://github.com/LexPredict/es-curator-cron).

---

# Debug commands

Print out all indices from elasticsearch.

```bash
/usr/local/bin/curator_cli \
    --host elasticsearch \
    --port 9200 \
    show_indices
```

Remove all indices older than one month.

```bash
/usr/local/bin/curator_cli \
    --host elasticsearch \
    --port 9200 \
    delete_indices \
    --ignore_empty_list \
    --filter_list '[{"filtertype":"age","source":"name","direction":"older","unit":"days","unit_count":30,"timestring":"logstash-%Y.%m.%d"},{"filtertype":"pattern","kind":"prefix","value":"logstash"}]'
```
