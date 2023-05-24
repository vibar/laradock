#!/bin/bash

echo 'changing env to '$1;

cat '.env.'$1 > '.env'

## Build fpm and cli for new version
docker-compose build php-fpm workspace

### Restart Container to use new version of php
docker-compose down
docker-compose up -d nginx mysql workspace redis

