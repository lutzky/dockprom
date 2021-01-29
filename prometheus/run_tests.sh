#!/bin/bash
docker exec -it prometheus /bin/promtool test rules /etc/prometheus/test.yml
