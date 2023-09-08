FROM maven:3.8.5-openjdk-17 as build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17
ENV EUREKA_SERVER eureka-server
WORKDIR /app
COPY --from=build ./app/target/*.jar ./app.jar
EXPOSE 8888
ENTRYPOINT java -jar app.jar
