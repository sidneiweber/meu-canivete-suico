from datetime import datetime
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

S3client = boto3.client('s3')

def generate_report(nbrrecords, nbrrecordsinserted, nbrrecordsretreived):
    with open('testing-results-'+now+'.txt', 'w') as f:
      f.write("Number of record to insert : " + str(nbrrecords))
      f.write("\n")
      f.write("Number of record inserted : " + str(nbrrecordsinserted))
      f.write("\n")
      f.write("Number of record consumed : " + str(nbrrecordsretreived))

try:
    producer = kafka.KafkaProducer(bootstrap_servers=client)
    print("Generating the 100 records")
    for i in range(1, nbrrecords+1):
        producer.send(topic, str(i)+') Is my cluster working ?')
        nbrrecordsinserted = i
except:
    with open('testing-results-'+now+'.txt', 'w') as f:
        f.write("ERROR : Broker not available while inserting record " + str(i) + " !")
        f.write("\n")
    generate_report(nbrrecords, nbrrecordsinserted, nbrrecordsretreived)
    S3client.upload_file('testing-results-'+now+'.txt', 'mybucket', '/subfolder/testing-results-'+now+'.txt')
    sys.exit(1)

print("End of the generation")

try:
    # prepare consumer
    tp = TopicPartition(topic,0)
    consumer = KafkaConsumer(bootstrap_servers=client)    
    consumer.assign([tp])
    consumer.seek_to_beginning(tp)

    # obtain the last offset value
    lastOffset = consumer.end_offsets([tp])[tp]

    # consome the messages
    for message in consumer:
        # print "Offset:", message.offset
        # print "Value:", message.value
        nbrrecordsretreived += 1
        if message.offset == lastOffset - 1:
            break
    with open('testing-results-'+now+'.txt', 'w') as f:
        f.write("Consume process completed")
        f.write("\n")
    generate_report(nbrrecords, nbrrecordsinserted, nbrrecordsretreived)
except:
    with open('testing-results-'+now+'.txt', 'w') as f:
        f.write("ERROR during consume process !")
        f.write("\n")
    generate_report(nbrrecords, nbrrecordsinserted, nbrrecordsretreived)


S3client.upload_file('testing-results-'+now+'.txt', 'mybucket', 'subfolder/testing-results-'+now+'.txt')

if nbrrecordsinserted == nbrrecordsretreived:
    sys.exit(0)
else:
    sys.exit(1)
