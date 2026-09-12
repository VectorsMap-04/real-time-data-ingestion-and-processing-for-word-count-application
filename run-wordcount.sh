#!/bin/bash

export PROJECT_HOME="$HOME/realtime-wordcount"

# Project-local Java
export JAVA_HOME="$PROJECT_HOME/jdk-17/java"
export PATH="$JAVA_HOME/bin:$PROJECT_HOME/venv/bin:$PATH"

# Spark networking
export SPARK_LOCAL_IP=127.0.0.1

echo "======================================"
echo " Starting Real-Time Word Count"
echo "======================================"
echo "Python : $(python --version 2>&1)"
echo "Java   : $(java -version 2>&1 | head -1)"
echo "Spark  : $(python -c 'import pyspark; print(pyspark.__version__)')"
echo "======================================"

spark-submit \
--packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.9 \
"$PROJECT_HOME/app/realtime_wordcount.py"
