#!/bin/bash

set -e

cd $(dirname $0)

host=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' pushgateway)

for i in *.exporter.sh; do
  ./$i | curl --data-binary @- \
    http://${host}:9091/metrics/job/nodeexporter
done
