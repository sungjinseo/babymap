FROM openjdk:11-jdk as builder
ARG JAR_FILE=./build/libs/*SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

CMD ["java", "-jar", "/app.jar"]