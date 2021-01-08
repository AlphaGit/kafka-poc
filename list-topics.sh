#!/bin/bash
docker-compose exec --workdir /bin \
    kafka1 \
    kafka-topics.sh --list --zookeeper zookeeper1:2181