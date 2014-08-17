# Scend

![scend-logo](logo.png)

## API

```elixir
# User 1
Scend.login %user{name: "user1"}
Scend.addContact %invite{name: "user2", host: "127.0.0.1", port: 8080, secret: "secret key"}
Scend.send "user2", "hello"
```

```elixir
# User 2
Scend.login %{name: "user2"}
Scend.createInvite
# => %invite{name: "user2", host: "127.0.0.1", port: 8080, secret: "secret key"}
```

## Development

You need [elixir] and mix installed.

```bash
# Compiling
$ mix compile
# Running tests
$ mix test
# Launch interactive shell
$ iex -S mix
```


[elixir]: http://elixir-lang.org/
