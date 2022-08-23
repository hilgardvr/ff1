#!/bin/sh

echo "Setting up db with 'mix ecto.setup'"
mix ecto.setup
echo "Running server with 'mix phx.server'"
mix phx.server
echo "end setting up container"
