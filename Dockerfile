FROM rubpana/spring-boot-app:dev
# VOLUME IS NOT SUPPORTED BY HEROKU
COPY target/*.jar /app.jar
CMD java -jar /app.jar