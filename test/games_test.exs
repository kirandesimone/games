defmodule GamesTest do
  @moduledoc """
  Tests for Games
  """
  use ExUnit.Case
  doctest Games

  describe "Games.Wordle.feedback/2" do
    test "all green" do
      expected = "green green green green green"
      assert Games.Wordle.feedback(["a", "a", "a", "a", "a"], "aaaaa") == expected
    end

    test "all grey" do
      expected = "grey grey grey grey grey"
      assert Games.Wordle.feedback(["b", "b", "b", "b", "b"], "aaaaa") == expected
    end

    test "all yellow" do
      expected = "yellow yellow yellow yellow yellow"
      assert Games.Wordle.feedback(["s", "n", "i", "p", "e"], "pines") == expected
    end

    test "all mixed" do
      expected = "green green green grey yellow"
      assert Games.Wordle.feedback(["s", "n", "a", "k", "e"], "snack") == expected
    end
  end
end
