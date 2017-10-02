# TCK development environments with Docker

(The bible)[https://asciinema.org/a/a5twy7h1v40g2d6hyjz8e79vv?speed=2]

## create apps

### postgresql

`docker volume create postgres_volume`

`docker run -d --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -v postgres_volume:/var/lib/postgresql postgres:latest`

### mysql

`docker volume create mysql_volume`

`docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 -v mysql_volume:/var/lib/mysql mysql:latest`

#### mysql with specific version

`docker volume create mysql_volume_5_6`

`docker run -d --name mysql_5_6 -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 -v mysql_volume_5_6:/var/lib/mysql mysql:5.6`

### couchdb + elasticsearch

(This)[https://github.com/the-cocktail/edo-entradas]

## manage apps

`docker ps` (docs)[https://docs.docker.com/engine/reference/commandline/ps/]

`docker restart NAME` (docs)[https://docs.docker.com/engine/reference/commandline/restart/]

`docker start NAME`

`docker stop NAME`

## (Manage volumes)[https://docs.docker.com/engine/reference/commandline/volume_create/]

`docker volume create NAME`   Create a volume

`docker volume inspect`       Display detailed information on one or more volumes

`docker volume ls`            List volumes

`docker volume prune`         Remove all unused volumes

`docker volume rm NAME`       Remove one or more volumes

## Rails apps

Remember to set the correct host, user and password
and
REMOVE THE KEY `socket` from `database.yml` at development section

#### Postgresql

```yaml
development:
  adapter: postgresql
  encoding: utf8
  database: project_name_development
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: 127.0.0.1
  user: postgres
  password: postgres
```

#### Mysql

```yaml
development:
  adapter: mysql2
  encoding: utf8
  database: yogui-hub_development
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: 127.0.0.1
  password: password
  username: root
```
