defmodule TungSahurBot do

  use Nostrum.Consumer
  alias TungSahurBot.Command.Weather
  alias TungSahurBot.Command.Digimon
  alias TungSahurBot.Command.GOT
  alias TungSahurBot.Command.Cat
  alias TungSahurBot.Command.Fruit
  alias TungSahurBot.Command.Name
  alias TungSahurBot.Command.Number
  alias TungSahurBot.Command.Newton
  alias Nostrum.Api.Message

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    cond do
      String.starts_with?(msg.content, "!weather") ->
        Message.create(msg.channel_id, Weather.handle_weather(msg.content))

      String.starts_with?(msg.content, "!digimon") ->
        Message.create(msg.channel_id, Digimon.handle_digimon(msg.content))

      String.starts_with?(msg.content, "!got") ->
        Message.create(msg.channel_id, GOT.handle_got(msg.content))

      String.starts_with?(msg.content, "!cat") ->
        Message.create(msg.channel_id, Cat.handle_cat(msg.content))

      String.starts_with?(msg.content, "!fruit") ->
        Message.create(msg.channel_id, Fruit.handle_fruit(msg.content))

      String.starts_with?(msg.content, "!name") ->
        Message.create(msg.channel_id, Name.handle_name(msg.content))

      String.starts_with?(msg.content, "!number") ->
        Message.create(msg.channel_id, Number.handle_number(msg.content))

      String.starts_with?(msg.content, "!calc") ->
        Message.create(msg.channel_id, Newton.handle_newton(msg.content))

      true ->
        :ignore
    end
  end

end
