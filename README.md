# How to generate rails new project with docker-compose

when i run command with $ rails new PROJECT with postgresql
i realize struggle and tired that generate rails project files and setup database. 
if i got something wrong local environment such as rbenv, rvm on macOS or another OS. it's made me burnout.

docker-compose is perfect awesome developerment environment. 
when i generate rails project with docker-compose, i don't need any setup on local environment like ruby, rails version, database setup. 
docker-compose made easy setup rails project, database and another env.

## ```rails new``` command with docker-compose
```
$ git clone https://github.com/x1wins/rails-new-with-docker-compose.git
$ cd ./rails-new-with-docker-compose
$ docker-compose run --no-deps web rails new [YOUR_PROJECT] --force --database=postgresql

mv [YOUR_PROJECT] ../
cd ../[YOUR_PROJECT]
cp config/database.yml ../[YOUR_PROJECT]/config/database.yml 
cp Dockerfile ../[YOUR_PROJECT]
cp docker-compose.yml ../[YOUR_PROJECT]
cp entrypoint.sh ../[YOUR_PROJECT]
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

