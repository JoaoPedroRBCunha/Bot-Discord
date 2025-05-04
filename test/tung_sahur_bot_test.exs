defmodule TungSahurBotTest do
  use ExUnit.Case
  doctest TungSahurBot

  test "greets the world" do
    assert TungSahurBot.hello() == :world
  end
end
