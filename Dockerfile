FROM java:8

# Just used in testing (Heroku doesn't support this command)
EXPOSE 8080

COPY target/*.jar /app.jar

CMD ["java", "-jar", "/app.jar"]