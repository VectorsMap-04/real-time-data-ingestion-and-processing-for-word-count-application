# Real-Time Data Ingestion and Processing for Word Count Application

A real-time data ingestion and stream-processing project that receives text messages through Apache Kafka and processes them using PySpark Structured Streaming to calculate and display word frequencies.

## Project Overview

This project demonstrates a real-time data pipeline using:

- Apache Kafka – real-time data ingestion and message streaming
- PySpark Structured Streaming – real-time stream processing
- Java 17 – runtime required by Spark
- Python 3.11 – application environment
- Spark SQL Kafka Connector – Kafka integration with PySpark

The application continuously receives text data through a Kafka topic, processes the incoming stream using PySpark, splits text into individual words, calculates their frequencies, and displays the results in real time.

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
               Data Ingestion
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
real-time-data-ingestion-and-processing-for-word-count-application/
│
├── app/
│   └── realtime_wordcount.py
│
├── jars/
│   └── spark-sql-kafka-0-10_2.12-3.5.9.jar
│
├── documentation/
│   ├── MSME_Original_Project_Documentation.pdf
│   ├── Upgraded_Project_Documentation.pdf
│   └── MSME_Project_Certificate.jpeg
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

The project uses a self-contained environment so that its software versions do not interfere with the system installation.

The development environment contains its own:

- Java 17 installation
- Python 3.11 environment
- Python virtual environment
- Apache Kafka installation

Local runtime directories are excluded from Git using `.gitignore`.

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
cd ~/real-time-data-ingestion-and-processing-for-word-count-application
source activate.sh
```

Verify the environment:

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
cd ~/real-time-data-ingestion-and-processing-for-word-count-application
source activate.sh
```

Run the application:

```bash
./run-wordcount.sh
```

The PySpark Structured Streaming application connects to Kafka and begins processing incoming messages.

## Data Flow

1. A producer sends text messages to a Kafka topic.
2. Kafka receives and stores the incoming messages.
3. PySpark Structured Streaming consumes the Kafka stream.
4. The application extracts the message value.
5. The incoming text is split into individual words.
6. Words are grouped and their frequencies are calculated.
7. The processed results are displayed in the console.

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

- Real-time data ingestion
- Event-driven data processing
- Apache Kafka producers and consumers
- Kafka topics
- PySpark Structured Streaming
- Stream processing
- Word-frequency aggregation
- Distributed data processing
- Isolated development environments

## Documentation

The repository contains both the original project documentation and the upgraded project documentation.

### Original MSME Documentation

The original project documentation prepared during the MSME project is preserved in:

```text
documentation/MSME_Original_Project_Documentation.pdf
```

### Upgraded Project Documentation

The upgraded documentation describes the complete implementation, workflow, architecture, technologies, execution process, and possible future enhancements:

```text
documentation/Upgraded_Project_Documentation.pdf
```

### MSME Project Certificate

The project completion certificate is preserved in:

```text
documentation/MSME_Project_Certificate.jpeg
```

## Future Enhancements

Possible future improvements include:

- Persistent storage using PostgreSQL or another database
- Real-time dashboards using Power BI or Grafana
- Window-based word-frequency analysis
- Top-N word detection
- Multiple Kafka partitions
- Fault-tolerant processing
- Docker-based deployment
- Cloud deployment
- Real-time monitoring
- REST API for processed results
- Advanced text analytics
- Natural Language Processing (NLP)

## Author

**Venky**

GitHub:

https://github.com/VectorsMap-04

