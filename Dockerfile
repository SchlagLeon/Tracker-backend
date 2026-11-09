#
# Build stage
#
FROM eclipse-temurin:25-jdk AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

LABEL org.name="DEIN-NAME"
#
# Package stage
#
FROM eclipse-temurin:25-jre
COPY --from=build /home/gradle/src/build/libs/golfrunden-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]