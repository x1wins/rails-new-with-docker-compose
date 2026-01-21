# Rails Docker Generator

Generate production-ready Rails projects with Docker Compose and PostgreSQL in seconds.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/x1wins/rails-new-with-docker-compose/main/install.sh | bash
```

Add to your PATH (add this to `~/.bashrc` or `~/.zshrc`):
```bash
export PATH="$HOME/.local/bin:$PATH"
```

Then reload your shell:
```bash
source ~/.zshrc  # or ~/.bashrc
```

### Manual Setup
```bash
git clone https://github.com/x1wins/rails-new-with-docker-compose.git
cd rails-new-with-docker-compose
./generate_rails_project.sh [YOUR_PROJECT]
```

## Quick Start

```bash
# Navigate to your projects directory
cd ~/projects

# Generate a new Rails project
rails-docker-gen my-awesome-app

# Your app is now running at http://localhost:3000
```

The generator creates a complete Rails project with:
- Rails 7+ with PostgreSQL
- Docker Compose configuration
- Database already configured and running
- Development and test environments ready

# Why?
Easy Generate Rails App Project with docker-compose.

No more sqlite with rails. 

Start PostgreSQL for Production Ready with Docker.

# Background
When I run command with `$ rails new PROJECT --database=postgresql`
I realize struggle and tired that generate rails project files and setup database. 
If I got something wrong local environment such as rbenv, rvm on macOS or another OS. It's made me burnout.

docker-compose is perfect awesome development environment. 
When i generate rails project with docker-compose, i don't need any setup on local environment like ruby, rails version, database setup. 
docker-compose made easy setup rails project, database and another env.

## Working with Generated Projects

### Setup Database
```bash
cd my-awesome-app
docker-compose run --no-deps web bundle exec rake db:prepare
```

Or manually:
```bash
docker-compose run --no-deps web bin/rails credentials:edit
docker-compose run --no-deps web bundle exec rake db:create
docker-compose run --no-deps web bundle exec rake db:migrate
docker-compose run --no-deps web bundle exec rake db:create RAILS_ENV=test
docker-compose run --no-deps web bundle exec rake db:migrate RAILS_ENV=test
```

### Start Rails Server
```bash
docker-compose up --build
```

### Bundle Install
```bash
docker-compose build --no-cache web
```

### Restart
```bash
docker-compose restart web
```

### Rails Console
```bash
docker-compose run --no-deps web bundle exec rails console
```

### Remove Container
```bash
docker rmi my-awesome-app_web
```

## Advanced: Manual Project Generation

If you want to manually generate a project without the installer:
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

