#!/bin/sh

docker compose up -d --build --force-recreate && docker exec -it m-krebs-neovim sh
