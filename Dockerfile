#### Stage 1: Build the application
FROM maven:3-openjdk-11 as build

# Set the current working directory inside the image
WORKDIR /app

COPY pom.xml .
COPY src src
RUN mvn package

FROM openjdk:11-jre
EXPOSE 8080
WORKDIR /app
COPY --from=build /app/target/*.jar .
CMD java -jar *.jar