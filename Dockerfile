FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    sphinxsearch \
    libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/log/sphinx/data

COPY files/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]