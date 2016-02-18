#!/bin/bash

DOCKER_HOST_IP=$(route -n | awk '/UG[ \t]/{print $2}')
ZOOKEEPER_HOST=${ZOOKEEPER_HOST:-$DOCKER_HOST_IP}
ZOOKEEPER_PORT=${ZOOKEEPER_PORT:-2181}
HTTP_PORT=${HTTP_PORT:-80}
LOG_LEVEL=${LOG_LEVEL:-info}
CONFIG_FILE=${CONFIG_FILE:-/sample_config.yaml}
SMTP_HOST=${SMTP_HOST:-$DOCKER_HOST_IP}

zk_monitor -z $ZOOKEEPER_HOST:$ZOOKEEPER_PORT -l $LOG_LEVEL -f $CONFIG_FILE -p $HTTP_PORT
