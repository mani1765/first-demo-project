# Start with a base image containing Maven and JDK
FROM maven:3.9.8-jdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Copy the source code
COPY src ./src

# Build the application
RUN mvn clean package

# Package the application as a JAR file
FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

# Expose the port
EXPOSE 8082

# Command to run the application
CMD ["java", "-jar", "app.jar"]
