from bitwalker/alpine-elixir-phoenix:1.13

workdir /usr/src/ff1

expose 4000

copy mix.exs mix.exs

run ["mix", "deps.get"]

cmd ["./docker-entrypoint-commands.sh"]

