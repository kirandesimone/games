defmodule Games.GuessingGame do
  @moduledoc """
  Documentation for `GuessingGame`
  """
  @limit 5

  defp player_input,
    do: IO.gets("Guess a number between 1 and 10: ") |> String.trim("\n") |> String.to_integer()

  defp game_loop(_, 1) do
    IO.puts("No more guesses, SORRY")
    Games.main("Return")
  end

  defp game_loop(random, count) do
    player_guess = player_input()

    case guess(player_guess, random) do
      {:incorrect, msg} ->
        IO.puts(msg)
        game_loop(random, count - 1)

      {:correct, msg} ->
        IO.puts(msg)
        Games.ScoreTracker.add_points(5)
        Games.main("Return")
    end
  end

  @spec guess(any, any) :: {:correct, <<_::64>>} | {:incorrect, <<_::64, _::_*8>>}
  def guess(player_guess, random) when player_guess < random, do: {:incorrect, "Too Low!"}
  def guess(player_guess, random) when player_guess > random, do: {:incorrect, "Too High!"}
  def guess(player_guess, random) when player_guess == random, do: {:correct, "You Win!"}

  @spec play :: :ok
  def play do
    game_loop(Enum.random(1..10), @limit)
  end
end
