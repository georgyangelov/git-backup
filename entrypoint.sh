#!/bin/sh
set -e

ssh-keyscan github.com > /root/.ssh/known_hosts

export PATH="$PATH:/git-backup"
export ARCHIVE_LOCATION="/git-backup/archives"
export CACHE_LOCATION="/git-backup/cache"

if [[ "$1" == "cron" ]]; then
    echo "0 * * * * backup-all.sh" | crontab - && crond -f -L /dev/stdout
elif [[ "$1" == "now" ]]; then
    ./backup-all.sh
fi
