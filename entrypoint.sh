#!/bin/bash
set -e

if [ "$ENV" = 'docker' ]; then
  echo "Running from Docker"
  exec java -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=$ENV -jar app.jar;
elif [ "$ENV" = 'dev' ]; then
  echo "Running from dev"
  exec java -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=$ENV -jar app.jar;
else
  echo "Running on Production"
  exec java -Djava.security.egd=file:/dev/./urandom -jar app.jar
fi