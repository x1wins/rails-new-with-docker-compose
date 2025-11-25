## How to Run
```
git clone https://github.com/x1wins/rails-new-with-docker-compose.git
cd ./rails-new-with-docker-compose
./generate_rails_project.sh [YOUR_PROJECT]
```
It's Done.

Go to `cd ../[YOUR_PROJECT]` There are generated project.

Rails app and PostgreSQL container are already running.

# Why?
Easy Generate Rails App Project with docker-compose.

No more sqlite with rails. 

Start PostgreSQL for Production Ready with Docker.

# Background
When I run command with `$ rails new PROJECT with postgresql`
I realize struggle and tired that generate rails project files and setup database. 
If I got something wrong local environment such as rbenv, rvm on macOS or another OS. It's made me burnout.

docker-compose is perfect awesome developerment environment. 
When i generate rails project with docker-compose, i don't need any setup on local environment like ruby, rails version, database setup. 
docker-compose made easy setup rails project, database and another env.

## How to Generate? (Manually generating Project)
```
git clone https://github.com/x1wins/rails-new-with-docker-compose.git
cd ./rails-new-with-docker-compose
docker-compose run --no-deps web rails new [YOUR_PROJECT] --force --database=postgresql

mv [YOUR_PROJECT] ../
cp config/database.yml ../[YOUR_PROJECT]/config/database.yml 
cp Dockerfile docker-compose.yml entrypoint.sh  ../[YOUR_PROJECT]/
cd ../[YOUR_PROJECT]
docker-compose up --build
```

## Setup
```bash
docker-compose build --no-cache
docker-compose run --no-deps web bin/rails credentials:edit
docker-compose run --no-deps web bundle exec rake db:create
docker-compose run --no-deps web bundle exec rake db:migrate
docker-compose run --no-deps web bundle exec rake db:create RAILS_ENV=test
docker-compose run --no-deps web bundle exec rake db:migrate RAILS_ENV=test
```
or
```bash
docker-compose run --no-deps web bundle exec rake db:prepare
```

## Start rails server
```bash
docker-compose up --build
```

## bundle install
```bash
docker-compose build --no-cache web
```

## Restart
```
docker-compose restart web
```

## Console
```
docker-compose run --no-deps web bundle exec rails console
```

## rm container
```bash
docker rmi rails-new-with-docker-compose_web
```

