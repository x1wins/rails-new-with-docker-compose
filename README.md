# How to generate rails new project with docker-compose

## ```rails new``` command with docker-compose
```
$ docker-compose run --no-deps web rails new . --force --database=postgresql
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
  <<: *default
  database: myapp_production
  username: myapp
  password: <%= ENV['MYAPP_DATABASE_PASSWORD'] %>
```