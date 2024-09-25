# Build stage
FROM maven:3.8.7-openjdk-18 AS build
WORKDIR /build
COPY ../../pom.xml .
RUN mvn dependency:go-offline
COPY ../../src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM amazoncorretto:17
ARG PROFILE=dev
ARG APP_VERSION=1.0.1
WORKDIR /app
COPY --from=build /build/target/spring-boot-*.jar /app/app.jar
EXPOSE 8080

# Environment variables for MySQL
ENV DB_URL=jdbc:mysql://mysql-server:3306/qr-sopra
ENV DB_USER=root
ENV DB_PWD= ""
ENV MAILDEV_URL=localhost
ENV ACTIVE_PROFILE=${PROFILE}
ENV JAR_VERSION=${APP_VERSION}

# Run the application
CMD ["java", "-jar", "-Dspring.profiles.active=${ACTIVE_PROFILE}", "-Dspring.datasource.url=${DB_URL}", "-Dspring.datasource.username=${DB_USER}", "-Dspring.datasource.password=${DB_PWD}", "/app/app.jar"]
