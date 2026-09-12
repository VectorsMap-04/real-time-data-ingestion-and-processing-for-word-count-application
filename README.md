# Real-Time Word Count using Kafka and PySpark

A real-time stream-processing project that receives text messages through Apache Kafka and processes them using PySpark Structured Streaming to calculate and display word frequencies.

## Project Overview

This project demonstrates a real-time data processing pipeline using:

- Apache Kafka – real-time message streaming
- PySpark Structured Streaming – stream processing
- Java 17 – runtime required by Spark
- Python 3.11 – application environment
- Spark SQL Kafka Connector – Kafka integration with PySpark

The application continuously reads text messages from a Kafka topic, splits the text into individual words, calculates their frequencies, and displays the results in real time.

## Architecture

```text
                Text Input
                    │
                    ▼
             Kafka Producer
                    │
                    ▼
             Kafka Topic
                    │
                    ▼
       PySpark Structured Streaming
                    │
                    ▼
             Word Processing
                    │
                    ▼
            Word Frequency
                    │
                    ▼
             Console Output
```

## Technology Stack

| Technology | Version |
|---|---|
| Python | 3.11.13 |
| Java | 17.0.20.1 |
| PySpark | 3.5.9 |
| Apache Kafka | 3.7.2 |
| Kafka Connector | Spark SQL Kafka 3.5.9 |
| Ubuntu | 26.04 LTS |

## Project Structure

```text
realtime-wordcount/
│
├── app/
│   └── realtime_wordcount.py
│
├── jars/
│   └── spark-sql-kafka-0-10_2.12-3.5.9.jar
│
├── activate.sh
├── requirements.txt
├── run-wordcount.sh
├── start-kafka.sh
├── start-zookeeper.sh
├── .gitignore
└── README.md
```

## Environment Isolation

The project uses a self-contained environment so its versions do not interfere with the system installation.

The project contains its own:

- Java 17 installation
- Python 3.11 installation
- Python virtual environment
- Kafka installation

These local runtime directories are excluded from Git using `.gitignore`.

## Requirements

The project requires:

- Ubuntu/Linux
- Java 17
- Python 3.11
- Apache Kafka 3.7.2
- PySpark 3.5.9

Python dependencies are specified in:

```text
requirements.txt
```

## Starting the Environment

From the project directory:

```bash
cd ~/realtime-wordcount
source activate.sh
```

Verify:

```bash
python --version
java -version
```

## Starting Kafka

Start ZooKeeper:

```bash
./start-zookeeper.sh
```

In another terminal, start Kafka:

```bash
./start-kafka.sh
```

## Running the Word Count Application

Activate the environment:

```bash
cd ~/realtime-wordcount
source activate.sh
```

Then run:

```bash
./run-wordcount.sh
```

The PySpark application connects to Kafka and begins processing incoming messages.

## Data Flow

1. A producer sends text messages to a Kafka topic.
2. Kafka stores and streams the messages.
3. PySpark Structured Streaming consumes the Kafka stream.
4. The application extracts the message value.
5. The text is split into individual words.
6. Words are grouped and counted.
7. The results are displayed in the console.

## Example

### Input

```text
hello world
hello kafka
kafka spark
```

### Example Output

```text
hello   2
kafka   2
world   1
spark   1
```

## Key Concepts Demonstrated

- Real-time data streaming
- Event-driven data processing
- Kafka producers and consumers
- Kafka topics
- PySpark Structured Streaming
- Distributed stream processing
- Word-frequency aggregation
- Isolated development environments

## Future Enhancements

Possible improvements include:

- Persistent storage using PostgreSQL or another database
- Real-time dashboards using Power BI, Grafana, or another visualization platform
- Window-based word-frequency analysis
- Top-N word detection
- Multiple Kafka partitions
- Fault-tolerant processing
- Docker-based deployment
- Cloud deployment
- Real-time monitoring
- REST API for accessing processed results
- Advanced text analytics and NLP

## Author

**Venky**

GitHub: https://github.com/VectorsMap-04
