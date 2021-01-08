#!/bin/bash
TOPIC_NAME=$1
if [ -z "$TOPIC_NAME" ]
then
    echo "Usage: consume-topic.sh TOPIC_NAME"
    exit 1
fi

docker-compose exec \
    -T \
    --workdir /bin \
    kafka1 \
    kafka-console-consumer.sh --bootstrap-server kafka1:9092 --topic $TOPIC_NAME --from-beginning --timeout-ms 1000