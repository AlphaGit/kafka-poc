# Build
FROM maven:3.6-openjdk-11 as builder
COPY src /home/app/src
COPY pom.xml home/app
WORKDIR /home/app
RUN mvn clean compile assembly:single

# Run
FROM openjdk:11-jre-slim as runner
COPY --from=builder /home/app/target/MessageProducer-1.0-SNAPSHOT-jar-with-dependencies.jar /usr/local/lib/MessageProducer.jar
COPY log4j2.xml /usr/local/lib/MessageProducer.log4j2.xml
ENTRYPOINT ["java", "-Dlog4j.configuration=file:///usr/local/lib/MessageProducer.log4j2.xml", "-jar", "/usr/local/lib/MessageProducer.jar", "ExampleTopic"]
