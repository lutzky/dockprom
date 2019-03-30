#!/bin/bash

cd $(dirname $0)

for i in *.exporter.sh; do
  ./$i | curl --data-binary @- \
    http://admin:admin@localhost:9091/metrics/job/nodeexporter
done
