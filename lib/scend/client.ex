defmodule Scend.Client do

  def connect(host \\ "127.0.0.1", port \\ 8080) do

    socket = Socket.TCP.connect!(host, port, packet: :line)

    IO.puts "Connected to #{host}:#{port}"

    spawn_link __MODULE__, :loop, [socket]

    socket
  end

  def send(client, msg) do
    client |> Socket.Stream.send!(msg)
  end

  # Private API

  def loop(socket) do
    socket |> Socket.Stream.recv!() |> print()
    loop socket
  end

  defp print(msg) do
    IO.puts "< #{msg}\n"
  end

end
