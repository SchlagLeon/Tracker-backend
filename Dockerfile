#
# Build stage
#
FROM eclipse-temurin:25-jdk AS build
WORKDIR /home/gradle/src
COPY . .
RUN chmod +x gradlew && ./gradlew build --no-daemon

#
# Package stage
#
FROM eclipse-temurin:25-jre
COPY --from=build /home/gradle/src/build/libs/golfrunden-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]