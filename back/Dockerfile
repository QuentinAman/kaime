FROM elixir:latest

RUN apt-get update && apt-get install -y postgresql-client
WORKDIR /app

COPY . .

RUN mix local.hex --force

RUN mix local.rebar --force

RUN mix deps.get

RUN mix do compile

CMD ["/app/entrypoint.sh"]