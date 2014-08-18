# Scend

![scend-logo](logo.png)

## API

```elixir
# User 1
iex> Scend.start
{:ok, pid}
iex> Scend.login "user1"
:ok
iex> Scend.redeem_invite %invite{name: "user2", host: "127.0.0.1", port: 8080, secret: "secret key"}
:ok
iex> Scend.contacts
[ %user{name: "user2"} ]
iex> Scend.send "user2", "hello"
:ok
```

```elixir
# User 2
iex> Scend.start
{:ok, pid}
iex> Scend.login "user2"
:ok
iex> Scend.create_invite
%invite{name: "user2", host: "127.0.0.1", port: 8080, secret: "secret key"}
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
