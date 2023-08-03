defmodule Games do
  @moduledoc """
  ## Executable
    Game menu for player to choose a game
  """
  def main(_args) do
    player_choice =
      IO.gets(~s"""
      What game would you like to play?
      1. Guessing Game
      2. Rock Paper Scissors
      3. Wordle

      enter "stop" to exit

      """)
      |> String.downcase()
      |> String.trim("\n")

    case player_choice do
      "guessing game" -> Games.GuessingGame.play()
      "rock paper scissors" -> Games.RockPaperScissors.play()
      "wordle" -> Games.Wordle.play()
      "stop" -> IO.puts("Thanks for playing!")
      _ -> IO.puts(~s("#{player_choice}" is not available))
    end
  end
end
