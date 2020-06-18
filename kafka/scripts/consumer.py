from datetime import datetime
from time import sleep
from json import dumps
from json import loads
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

consumer = KafkaConsumer('numtest', bootstrap_servers=client, auto_offset_reset='earliest', enable_auto_commit=False, group_id='group-teste', value_deserializer=lambda x: loads(x.decode('utf-8')))    
# consome the messages
for message in consumer:
    message = message.value
    print(message)
    consumer.commit()
    #collection.insert_one(message)
    #print('{} added to {}'.format(message, collection))
