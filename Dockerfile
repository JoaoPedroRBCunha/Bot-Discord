FROM  elixir:1.18.3-alpine

WORKDIR /usr/src/elixir/tungsahurbot

COPY mix.exs mix.lock ./

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

COPY . .

CMD ["mix", "run", "--no-halt"]
