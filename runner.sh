#!/bin/sh


groupmod -o -g "$GID" aaa 2>/dev/null
usermod -o -u "$UID" aaa 2>/dev/null

mkdir -p /appdata/config /appdata/credentials

chown -R aaa:aaa /app/home
chown -R aaa:aaa /sync
chown -R aaa:aaa /appdata

while :
do
  su -s /bin/sh -c "/usr/local/bin/ruby /app/drivesync-master/drivesync.rb" aaa
  sleep "${INTERVAL:-300}"
done
