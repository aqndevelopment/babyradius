#!/bin/bash
set -e
set -x

#mkdir -p /etc/freeradius/3.0/mods-enabled/

#envsubst < /etc/freeradius/3.0/mods-available/sql.template > /etc/freeradius/3.0/mods-available/sql
# Render template ke file final
sed -e "s|__DB_HOST__|${DB_HOST}|g" \
    -e "s|__DB_PORT__|${DB_PORT}|g" \
    -e "s|__DB_USER__|${DB_USER}|g" \
    -e "s|__DB_PASS__|${DB_PASS}|g" \
    -e "s|__DB_NAME__|${DB_NAME}|g" \
    /etc/freeradius/3.0/mods-available/sql.template \
    > /etc/freeradius/3.0/mods-available/sql

# sed -i 's|@@MODULE_NAME@@|${.:name}|g' /etc/freeradius/3.0/mods-available/sql
ln -sf /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled/sql

exec freeradius -X
