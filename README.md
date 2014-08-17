# Scend


## Architecture


* Connector - Connect to other Nodes
* Listener - Accept incoming connections


## API

```elixir
Scend.login "me"
Scend.addContact %{name: "you", host: "127.0.0.1", port: 8080}
Scend.send "you", "hello"
```
