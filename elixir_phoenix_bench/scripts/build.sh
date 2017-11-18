#!/bin/bash

mix do deps.get, deps.compile, release --env=prod --verbose
