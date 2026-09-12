from pyspark.sql import SparkSession
from pyspark.sql.functions import explode, split, col


# --------------------------------------------------
# 1. Create Spark Session
# --------------------------------------------------

spark = (
    SparkSession.builder
    .appName("RealtimeWordCount")
    .master("local[2]")
    .getOrCreate()
)

spark.sparkContext.setLogLevel("WARN")


# --------------------------------------------------
# 2. Read streaming data from Kafka
# --------------------------------------------------

lines = (
    spark.readStream
    .format("kafka")
    .option("kafka.bootstrap.servers", "localhost:9092")
    .option("subscribe", "wordcount")
    .option("startingOffsets", "latest")
    .load()
)


# --------------------------------------------------
# 3. Convert Kafka binary value to string
# --------------------------------------------------

text = lines.select(
    col("value").cast("string").alias("text")
)


# --------------------------------------------------
# 4. Split sentences into individual words
# --------------------------------------------------

words = (
    text
    .select(
        explode(
            split(col("text"), "\\s+")
        ).alias("word")
    )
    .filter(col("word") != "")
)


# --------------------------------------------------
# 5. Count words
# --------------------------------------------------

word_counts = (
    words
    .groupBy("word")
    .count()
    .orderBy(col("count").desc(), col("word").asc())
)


# --------------------------------------------------
# 6. Display results in terminal
# --------------------------------------------------
query = (
    word_counts
    .writeStream
    .outputMode("complete")
    .format("console")
    .option("truncate", "false")
    .option("numRows", 50)
    .option(
        "checkpointLocation",
        "/home/venky/realtime-wordcount/checkpoints/wordcount"
    )
    .start()
)


# --------------------------------------------------
# 7. Keep streaming application running
# --------------------------------------------------

query.awaitTermination()
