# How to generate rails new project with docker-compose

when i run command with $ rails new PROJECT with postgresql
i realize struggle and tired that generate rails project files and setup database. 
if i got something wrong local environment such as rbenv, rvm on macOS or another OS. it's made me burnout.

docker-compose is perfect awesome developerment environment. 
when i generate rails project with docker-compose, i don't need any setup on local environment like ruby, rails version, database setup. 
docker-compose made easy setup rails project, database and another env.

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

## Setup
```bash
docker-compose run --no-deps web bundle exec rails webpacker:install
docker-compose run --no-deps web bundle exec rails webpacker:install RAILS_ENV=test
docker-compose run --no-deps web bundle exec rake db:create
docker-compose run --no-deps web bundle exec rake db:migrate
docker-compose run --no-deps web bundle exec rake db:create RAILS_ENV=test
docker-compose run --no-deps web bundle exec rake db:migrate RAILS_ENV=test
```

## Start rails server
```bash
docker-compose up --build
```

## Restart
```
docker-compose restart web
```

## Console
```
docker-compose run --no-deps web bundle exec rails console
```

## Rake
```bash
docker-compose run --no-deps web rails g task dev shippings_seeds
```

## Testing
Selenium Grid
- http://localhost:4444

Selenium Grid noVNC
- http://localhost:7900
```bash
docker-compose run --no-deps web rails test
docker-compose run --no-deps web rails test:system
docker-compose run --no-deps web rails test:all
```

### apple silicon m1 chip
there is two solution for selenium on m1 chip. selenium is not working on m1 chip. there is need builded image for arm64 for m1 chip.
- first solution 
  - arm64 seleniarm
    - docker-compose.yml
      ```bash
      image: seleniarm/standalone-chromium:latest
      ```
- second solution 
  - build chroium in local
    - https://github.com/seleniumhq-community/docker-seleniarm#only-building-the-images
    - docker-compose.yml
      ```bash
      image: local-seleniarm/standalone-chromium:latest
      ```
      ```bash
      git clone https://github.com/seleniumhq-community/docker-seleniarm.git
      cd docker-seleniarm
      ./build.sh arm64
      ```