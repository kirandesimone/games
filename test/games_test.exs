defmodule GamesTest do
  use ExUnit.Case
  doctest Games

  test "greets the world" do
    assert Games.hello() == :world
  end

  describe "Games.Wordle.feedback/2" do
    test "all green" do
    end
  end
end
