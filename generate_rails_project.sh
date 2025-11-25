#!/bin/bash

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: $0 <project_name>"
  exit 1
fi

docker-compose run --no-deps web rails new $PROJECT_NAME --force --database=postgresql

mv $PROJECT_NAME ../
cp config/database.yml ../$PROJECT_NAME/config/database.yml 
cp Dockerfile docker-compose.yml entrypoint.sh ../$PROJECT_NAME/
cd ../$PROJECT_NAME
docker-compose up --build
