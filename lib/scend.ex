defmodule Scend do


  def start do

    spawn_link Scend.Server, :start_link, []

  end

  def login(host, port) do
    Scend.Client.connect host, port
  end

  def send(client, msg) do
    Scend.Client.send(client, msg)
  end


end
