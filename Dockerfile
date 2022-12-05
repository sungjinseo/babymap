FROM openjdk:11-jdk as builder
WORKDIR application
# JAR_FILE 변수 정의 -> 기본적으로 jar file이 2개이기 때문에 이름을 특정해야함
#ARG JAR_FILE=./build/libs/babymap-0.0.1-SNAPSHOT.jar
ARG JAR_FILE=./build/libs/*.jar
# JAR 파일 메인 디렉토리에 복사
COPY ${JAR_FILE} application.jar
# 시스템 진입점 정의 
#ENTRYPOINT ["java","-jar","/app.jar"]
RUN java -Djarmode=layertools -jar application.jar extract

FROM openjdk:11-jdk
WORKDIR application
#ENV port 8080
#ENV spring.profiles.active local
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]