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

  @doc """
  play_rps   fight logic
  ## Examples

    iex > play_rps("rock", "paper")
    "You Win!"
  """
  @spec play_rps(String.t(), String.t()) :: :ok
  def play_rps(player_1, player_2) do
    cond do
      player_1 == player_2 -> IO.puts("It's a tie!")
      player_1 == "rock" and player_2 == "scissors" -> IO.puts("You Win!")
      player_1 == "paper" and player_2 == "rock" -> IO.puts("You Win!")
      player_1 == "scissors" and player_2 == "paper" -> IO.puts("You Win!")
      true -> IO.puts("You Lose!")
    end
  end

  @spec play :: :ok
  def play do
    player_1 = player_choice()
    player_2 = ai_chioce()
    play_rps(player_1, player_2)
  end
end
