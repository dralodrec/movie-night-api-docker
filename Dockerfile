
# Stage 1: Build the application using Maven and Java 25
FROM maven:3.9-eclipse-temurin-25 AS build

WORKDIR /workspace/app

COPY . .

RUN mvn clean package -DskipTests

# Stage 2: Run the application using Java 25
FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=build /workspace/app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
