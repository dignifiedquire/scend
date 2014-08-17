defmodule Scend.Client do


  # Client API

  def connect(host \\ "127.0.0.1", port \\ 8080, nick) do

    socket = Socket.TCP.connect! host, port, packet: :line

    IO.puts "#{nick}: Connected to #{host}:#{port}"
    state = %{socket: socket, nick: nick}

    loop state
  end

  # Private API

  defp loop(state) do
    read_line() |> eval_line(state.socket)
    state.socket |> Socket.Stream.recv! |> print(state.nick)

    loop(state)
  end


  defp print(msg, nick) do
    IO.puts "#{nick}: #{msg}\n"
  end

  defp read_line do
    case IO.gets "> " do
      :eof -> IO.puts "-- finished\n"
      {:error, reason} -> IO.puts "-- error: #{inspect reason}\n"
      data -> data
    end
  end

  defp eval_line(line, socket) do
    socket |> Socket.Stream.send! line
  end

end
