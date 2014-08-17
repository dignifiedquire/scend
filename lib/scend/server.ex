defmodule Scend.Server do
  use Reagent.Behaviour
  use GenServer


  @doc """
  Starts the Server.
  """
  @spec start_link(Keyword.t) :: { :ok, pid } | { :error, term }
  def start_link(opts \\ [port: 8080]) do
    IO.puts "Listening on 127.0.0.1:#{opts[:port]}.."
    Reagent.start __MODULE__, opts
  end


  @doc """
  Start callback for Reagent
  """
  def start(connection) do
    :gen_server.start __MODULE__, connection, []
  end

  def send(server, msg) do
    GenServer.call(server, {:send, msg})
  end

  def init(connection) do
    { :ok, connection }
  end

  # this message is sent when the socket has been completely accepted and the
  # process has been made owner of the socket, you don't need to wait for it
  # when implementing handle because it's internally handled
  def handle_info({ Reagent, :ack }, connection) do
    connection |> Socket.active!

    { :noreply, connection }
  end

  def handle_info({ :tcp, _, data }, connection) do
    IO.puts "> #{data}\n"

    { :noreply, connection }
  end

  def handle_info({ :tcp_closed, _ }, _connection) do
    { :stop, :normal, _connection }
  end

  def handle_call({:send, msg}, _from, connection) do
    connection |> Socket.Stream.send! msg
    { :noreply, connection }
  end
end
