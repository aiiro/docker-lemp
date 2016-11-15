# docker-lemp

LEMP stack environment.

## Current stacks:
- CentOS
- Nginx
- PHP7.0
- PHP-FPM
- MariaDB
- memcached

## Usage
```
$ docker-compose up
```

## Environment Variables

MariaDB environments are set in envfiles/db_env.
If you would like to change them, edit envfiles/db_env.

See https://hub.docker.com/_/mariadb/ for each variables description.
