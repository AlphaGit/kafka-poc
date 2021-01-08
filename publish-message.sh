#!/bin/bash
TOPIC_NAME=$1
MESSAGE_CONTENTS=$2
if [[ -z "$TOPIC_NAME" || -z "$MESSAGE_CONTENTS" ]]
then
    echo "Usage: publish-message.sh TOPIC_NAME MESSAGE_CONTENTS"
    exit 1
fi

echo "$MESSAGE_CONTENTS" | docker-compose exec \
    -T \
    --workdir /bin \
    kafka1 \
    kafka-console-producer.sh --broker-list kafka1:9092 --topic $TOPIC_NAME