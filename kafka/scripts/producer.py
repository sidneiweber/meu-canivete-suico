from datetime import datetime
from time import sleep
from json import dumps
import boto3
import os
import sys
from kafka import KafkaConsumer, KafkaProducer, TopicPartition

#settings
client = ["localhost:9092"]
topic = 'test-auto-kafka'
nbrrecords = int(50)
nbrrecordsinserted = int(0)
nbrrecordsretreived = int(0)
now = datetime.now().strftime("%d%m%Y-%H%M")

#S3client = boto3.client('s3')

producer = KafkaProducer(bootstrap_servers=client, value_serializer=lambda x: dumps(x).encode('utf-8'))
print("Generating the 100 records")
for e in range(1000):
    data = {'number' : e}
    producer.send('numtest', value=data)
    sleep(5)

print("End of the generation")
