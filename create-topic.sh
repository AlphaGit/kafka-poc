#!/bin/bash
TOPIC_NAME=$1
if [ -z "$TOPIC_NAME" ]
then
    echo "Usage: create-topic.sh TOPIC_NAME"
    exit 1
fi

docker-compose exec \
    --workdir /bin \
    kafka1 \
    kafka-topics.sh --create --zookeeper zookeeper1:2181 --replication-factor 3 --partitions 1 --topic $TOPIC_NAME