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

  describe "Games.RockPaperScissors.play_rps/2" do
    test "player 1 wins" do
      assert Games.RockPaperScissors.play_rps("rock", "scissors") == "Player 1"
    end

    test "player 2 wins" do
      assert Games.RockPaperScissors.play_rps("rock", "paper") == "paper"
    end

    test "a tied game" do
      assert Games.RockPaperScissors.play_rps("rock", "rock") == "Both"
    end
  end

  describe "Games.GuessingGame.guess/2" do
    test "too low guess" do
      expected = {:incorrect, "Too Low!"}
      assert Games.GuessingGame.guess(5, 9) == expected
    end

    test "too high guess" do
      expected = {:incorrect, "Too High!"}
      assert Games.GuessingGame.guess(9, 3) == expected
    end

    test "correct guess" do
      expected = {:correct, "You Win!"}
      assert Games.GuessingGame.guess(5, 5) == expected
    end
  end

  describe "Games.ScoreTracker" do
    test "add points" do
      Games.ScoreTracker.start_link()
      Games.ScoreTracker.add_points(10)
      assert Games.ScoreTracker.get_points() == 10
    end

    test "get points" do
      Games.ScoreTracker.start_link()
      assert Games.ScoreTracker.get_points() == 10
    end
  end
end
