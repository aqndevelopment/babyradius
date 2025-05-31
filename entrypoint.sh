#!/bin/bash
set -e

echo "[entrypoint] Generate sql config from template..."
envsubst < /etc/freeradius/3.0/mods-available/sql.template > /etc/freeradius/3.0/mods-available/sql

# Remove old symlink kalau ada, lalu buat symlink baru ke sql yang sudah digenerate
if [ -L /etc/freeradius/3.0/mods-enabled/sql ]; then
    rm /etc/freeradius/3.0/mods-enabled/sql
fi

ln -s /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled/sql

echo "[entrypoint] Starting FreeRADIUS..."
exec "$@"
