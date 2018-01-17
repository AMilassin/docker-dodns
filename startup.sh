#!/bin/sh

TIME=$(date +%R)

echo "$TIME Running startup script...."

echo "$TIME Fixing permissions"
chmod -R go+rw /config

if [ ! -f "/config/dodns.conf.js" ]; then
  echo "$TIME Copying configuration file..."
  cp /root/dodns.conf.js.default /config/dodns.conf.js
fi

ln -s /config /root/config

echo "$TIME Startup script: DONE, running dodns for the first time"
echo "$TIME logging output to dodns.log..."


# run script for first time
node /root/dodns.js > /config/dodns.log 2>&1


# start cron daemon (in frontend, so the docker container sticks)
touch /var/log/cron.log
crond -l 2 -L /var/log/cron.log && tail -f /var/log/cron.log
