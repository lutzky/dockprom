#!/bin/bash
#
# Description: Check if reboot is required
#
# Adapted from:
# https://github.com/prometheus/node_exporter/blob/master/text_collector_examples/apt.sh

echo '# HELP node_reboot_required Node reboot is required for software updates.'
echo '# TYPE node_reboot_required gauge'
if [[ -f '/run/reboot-required' ]] ; then
  echo 'node_reboot_required 1'
else
  echo 'node_reboot_required 0'
fi
