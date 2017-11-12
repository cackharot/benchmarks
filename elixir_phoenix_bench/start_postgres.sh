#!/bin/bash

# Runs a docker based postgres db
docker pull postgres && \
    docker run --rm -p 5432:5432 --name phx-postgres -e POSTGRES_PASSWORD=pass123 -d postgres
