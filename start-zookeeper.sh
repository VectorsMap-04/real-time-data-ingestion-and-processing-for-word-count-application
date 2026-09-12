#!/bin/bash

export PROJECT_HOME="$HOME/realtime-wordcount"
export JAVA_HOME="$PROJECT_HOME/jdk-17/java"
export PATH="$JAVA_HOME/bin:$PATH"

echo "Starting ZooKeeper..."
echo "Java: $JAVA_HOME"

"$PROJECT_HOME/kafka/bin/zookeeper-server-start.sh" \
"$PROJECT_HOME/kafka/config/zookeeper.properties"
