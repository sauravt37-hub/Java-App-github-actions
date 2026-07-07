# Use the official OpenJDK 8 image as the base image
FROM openjdk:8

# Set the working directory within the container
WORKDIR /app

# Copy the necessary files into the container
COPY src/main/java/ /app/src/main/java/
COPY pom.xml /app/

# Build the application using Maven
RUN apt-get update && apt-get install -y maven && mvn package

# Expose port 8080 (assuming your application runs on port 8080)
EXPOSE 8080

# Define the entry point to run your Java application
CMD ["java", "-jar", "target/springboot-images-new.jar"]
