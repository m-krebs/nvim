#!/bin/sh

docker compose -f docker/docker-compose.yml up -d --build --force-recreate && docker exec -it m-krebs-neovim sh
