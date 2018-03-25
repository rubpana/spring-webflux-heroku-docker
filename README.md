# spring-webflux-heroku-docker
Demo project for Spring webflux deployed on Heroku as Docker container

## Initial setup on Heroku (It works for any Java project deployed as Docker container)
- Create an application on Heroku named "spring-web-dev-docker"
- From the root folder of this git project, run:
```sh
$ heroku login
# Download the repository and commit all your changes
$ git clone https://github.com/rubpana/spring-webflux-heroku-docker.git
$ cd spring-webflux-heroku-docker
$ git add .
$ git commit -m "Initial commit"
# Uploading your changes to your repo
$ git push
```

// TODO