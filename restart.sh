#!/bin/bash

docker-compose stop graph && docker-compose rm graph -y && docker-compose up -d graph