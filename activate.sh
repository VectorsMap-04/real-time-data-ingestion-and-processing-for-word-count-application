#!/bin/bash

export PROJECT_HOME="$HOME/realtime-wordcount"

# Project-local Java
export JAVA_HOME="$PROJECT_HOME/jdk-17/java"
export PATH="$JAVA_HOME/bin:$PATH"

# Project-local Python
export PATH="$PROJECT_HOME/venv/bin:$PATH"

# Spark networking
export SPARK_LOCAL_IP=127.0.0.1

echo "======================================"
echo " Real-Time Word Count Environment"
echo "======================================"
echo "Project : $PROJECT_HOME"
echo "Java    : $JAVA_HOME"
echo "Python  : $(python --version 2>&1)"
echo "PySpark : $(python -c 'import pyspark; print(pyspark.__version__)')"
echo "======================================"
