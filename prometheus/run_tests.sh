#!/bin/bash

yamllint alert.rules prometheus.yml
docker exec -it prometheus /bin/promtool test rules /etc/prometheus/test.yml
