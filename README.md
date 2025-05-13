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
$ docker-compose run --no-deps web rails new . --force --database=postgresql
```

## Dockerfile
```dockerfile
# To this
ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle"

# Set production environment
#ENV RAILS_ENV="production" \
#    BUNDLE_DEPLOYMENT="1" \
#    BUNDLE_PATH="/usr/local/bundle" \
#    BUNDLE_WITHOUT="development"

```

## config/database.yml
```
$ vim config/database.yml
```
```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: myapp_development

test:
  <<: *default
  database: myapp_test

production:
  primary: &primary_production
    <<: *default
    database: myapp_production
    username: myapp
    password: <%= ENV["MYAPP_DATABASE_PASSWORD"] %>
  cache:
    <<: *primary_production
    database: myapp_production_cache
    migrations_paths: db/cache_migrate
  queue:
    <<: *primary_production
    database: myapp_production_queue
    migrations_paths: db/queue_migrate
  cable:
    <<: *primary_production
    database: myapp_production_cable
    migrations_paths: db/cable_migrate
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

## rm container
```bash
docker rmi rails-new-with-docker-compose_web
```


## Restart
```
docker-compose restart web
```

## Console
```
docker-compose run --no-deps web bundle exec rails console
```

