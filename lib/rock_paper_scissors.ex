defmodule Games.RockPaperScissors do
  @moduledoc """
  Documentation for `RockPaperScissors` game
  """
  defp player_choice,
    do:
      IO.gets(~s(Choose "rock", "paper", or "scissors": ))
      |> String.trim("\n")
      |> String.downcase()

  defp ai_chioce, do: Enum.random(["rock", "paper", "scissors"])

  def play_rps("rock", "scissors"), do: "Player 1"
  def play_rps("paper", "rock"), do: "Player 1"
  def play_rps("scissors", "paper"), do: "Player 1"
  def play_rps(player_1, player_2) when player_1 == player_2, do: "Both"
  def play_rps(_player_1, player_2), do: player_2

  @spec decide(any, any) :: :ok
  defp decide(player_1, player_2) do
    case play_rps(player_1, player_2) do
      "Player 1" ->
        IO.puts("You Win!")
        Games.ScoreTracker.add_points(10)

      "Both" ->
        IO.puts("You Tied!")

      _ ->
        IO.puts("You Lose!")
    end

    Games.main("Return")
  end

  @spec play :: :ok
  def play do
    player_1 = player_choice()
    player_2 = ai_chioce()
    decide(player_1, player_2)
  end
end
