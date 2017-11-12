#!/bin/bash

mix new phx_cqrs --module PhxCqrs --umbrella \
&& cd phx_cqrs/apps \
&& mix new authorisation --module PhxCqrs.Authorisation \
&& mix new todos --module PhxCqrs.Todos --sup \
&& mix new commands --module PhxCqrs.Commands \
&& mix new events --module PhxCqrs.Events \
&& mix new infrastructure --module PhxCqrs.Infrastructure \
&& mix new projections --module PhxCqrs.Projections --sup \
&& mix phoenix.new web --app web --module PhxCqrs.Web --no-brunch --no-html --no-ecto
