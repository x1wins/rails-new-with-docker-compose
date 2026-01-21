#!/bin/bash

PROJECT_NAME=$1
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR="${2:-$(pwd)}"

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: $0 <project_name> [target_directory]"
  exit 1
fi

cd "$SCRIPT_DIR"
docker-compose run --no-deps web rails new $PROJECT_NAME --force --database=postgresql

TARGET_PATH="$WORK_DIR/$PROJECT_NAME"
mv $PROJECT_NAME "$TARGET_PATH"
cp config/database.yml "$TARGET_PATH/config/database.yml" 
cp Dockerfile docker-compose.yml entrypoint.sh "$TARGET_PATH/"
cd "$TARGET_PATH"
docker-compose up --build
