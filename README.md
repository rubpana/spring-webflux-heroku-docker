# spring-webflux-heroku-docker
Demo project for Spring webflux deployed on Heroku as Docker container

## Initial setup on Heroku (It works for any Java project deployed as Docker container)
- Create an application on Heroku named "spring-web-dev-docker"
- IMPORTANT: do login on Heroku and set `JAVA_TOOL_OPTIONS`:
```sh
$ heroku login
$ heroku config:set JAVA_TOOL_OPTIONS="-Xmx300m" -a spring-web-dev-docker
```
If you don't configure the Heroku app like that, the docker container process will fail like
`Error R14 (Memory quota exceeded)`

- From the root folder of this git project, run:
```sh
$ heroku login
# Download the repository and commit all your changes
$ git clone https://github.com/rubpana/spring-webflux-heroku-docker.git
$ cd spring-webflux-heroku-docker
$ git add .
$ git commit -m "Initial commit"
# Uploading your changes to your repo (to keep your changes in your repo, not needed for Heroku)
$ git push
# Just needed the first time
$ heroku container:login
# Generating application jar again to be updated
$ mvn clean install
# Deploy your container on Heroku
$ heroku container:push web --app spring-web-dev-docker
```

Although the tomcat server will be running at port XXXX, Heroku exposes your MVC application at:
```
https://spring-web-dev-docker.herokuapp.com/
```
So, you must invoke: https://spring-web-dev-docker.herokuapp.com/test to test the API exposed for this project.

## Heroku logs
```sh
$ heroku logs -t --app spring-web-dev-docker
```
## Running locally
```sh
docker build -t spring-app .
docker container run -d -p 8080:8080 --name app spring-app
```
It will serve your application at port 8080.
To test the application `http://localhost:8080/test`.

## Making changes on the project and deploying them to Heroku
```sh
$ heroku login
# Download the repository and commit all your changes
$ git clone https://github.com/rubpana/spring-webflux-heroku-docker.git
$ cd spring-webflux-heroku-docker
$ git add .
$ git commit -m "Changes"
# Uploading your changes to your repo (to keep your changes in your repo, not needed for Heroku)
$ git push
# Just needed the first time
$ heroku container:login
# Generating application jar again to be updated
$ mvn clean install
# Deploy your container on Heroku
$ heroku container:push web --app spring-web-dev-docker
```

## COMMON ISSUES WITH DOCKER CONTAINERS
### (Boot timeout) - failed to bind to $PORT
- In Heroku environment, youy Spring boot application must be running on PORT that Heroku env variable says. For that reason, we have configured the embedded tomcat port programmatically with this env variable if exists (see SpringWebfluxExampleApplication). If you don't do this, you will see this error in Heroku app logs: `Error R10 (Boot timeout) -> Web process failed to bind to $PORT within 60 seconds of launch``

- ### Memory quota exceeded
- It is possible that your Spring boot aplication cannot be launched if JVM heap configuration is not correct for your app. In that case, you will see this error in Heroku app logs:
`Error R14 (Memory quota exceeded)`