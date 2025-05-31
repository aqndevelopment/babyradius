FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y freeradius freeradius-mysql gettext-base vim && \
    rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /etc/freeradius/3.0/mods-enabled
# # Copy file sql.template ke mods-available
# COPY mods-available/sql.template /etc/freeradius/3.0/mods-available/sql.template

# # Copy entrypoint.sh
# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]
CMD ["freeradius", "-f", "-X"]
