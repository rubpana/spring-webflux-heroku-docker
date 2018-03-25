FROM java:8

# Just used in testing (Heroku doesn't support this command)
EXPOSE 8080

COPY target/spring-webflux-example-0.0.1-SNAPSHOT.jar /app.jar

CMD ["java", "-jar", "/app.jar"]