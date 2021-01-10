package com.alpha.MessageProducer;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;

import java.util.Properties;

public class Main {

    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Usage: java MessageProducer.java TOPIC_NAME");
            return;
        }

        String topicName = args[0].toString();

        Properties props = new Properties();
        props.put("bootstrap.servers", "kafka1:9092");
        props.put("acks", "all");
        props.put("retries", 0);
        props.put("batch.size", 16384);
        props.put("linger.ms", 1);
        props.put("buffer.memory", 33554432);
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        Producer<String, String> producer = new KafkaProducer<>(props);

        for (int i = 0; i < 10; i++) {
            String recordKey = Integer.toString(i);
            String recordValue = "Message number " + recordKey + ".";
            ProducerRecord record = new ProducerRecord<>(topicName, recordValue, recordValue);
            producer.send(record);
        }
        System.out.println("Messages sent successfully to topic " + topicName + ".");
        producer.close();
    }
}
