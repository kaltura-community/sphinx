#!/bin/bash

cleanup() {
    echo "Caught signal. Stopping searchd..."
    searchd --stop
    exit 0
}

if [[ -z "${SPHINX_CONFIG_FILE}" ]]; then
    SPHINX_CONFIG_FILE="/etc/sphinxsearch/sphinx.conf"
fi

if [[ -z "${DATA_DIR}" ]]; then
    DATA_DIR="/var/log/sphinx/data"
fi

if [[ ! -d "${DATA_DIR}" ]]; then
    mkdir -p ${DATA_DIR}
fi

trap cleanup SIGTERM
searchd --config ${SPHINX_CONFIG_FILE} --console --pidfile &
wait $!