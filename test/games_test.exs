defmodule GamesTest do
  use ExUnit.Case
  doctest Games

  test "greets the world" do
    assert Games.hello() == :world
  end

  describe "Games.Wordle.feedback/2" do
    test "all green" do
      expected = [:green, :green, :green, :green, :green]
      assert Games.Wordle.feedback("aaaaa", "aaaaa") == expected
    end

    test "all grey" do
      expected = [:grey, :grey, :grey, :grey, :grey]
      assert Games.Wordle.feedback("bbbbb", "aaaaa") == expected
    end

    test "all yellow" do
      expected = [:yellow, :yellow, :yellow, :yellow, :yellow]
      assert Games.Wordle.feedback("snipe", "pines") == expected
    end

    test "all mixed" do
      expected = [:green, :green, :green, :grey, :yellow]
      assert Games.Wordle.feedback("snake", "snack")
    end
  end
end
