#!/bin/bash
#
# Description: Check last success timestamp of backups

files="$(find /media/lutzky-takeout -maxdepth 2 -name last-success)"

echo '# HELP last_backup_success Time of last backup, seconds since unix epoch'
echo '# TYPE last_backup_success gauge'
if [[ -z $files ]]; then
  echo "last_backup_success{path=\"no_files_found\"} 0"
  exit 0
fi

for stamp_path in $files; do
  name=$(basename ${stamp_path%/last-success})
  stamp=$(stat -c '%Y' $stamp_path)
  echo "last_backup_success{path=\"${name}\"} ${stamp}"
done
