defmodule Games.GuessingGame do
  @moduledoc """
  Documentation for `GuessingGame`
  """
  @limit 5

  defp guess,
    do: IO.gets("Guess a number between 1 and 10: ") |> String.trim("\n") |> String.to_integer()

  defp game_loop({random, count}) do
    input = guess()
    cond do
      count == 1 -> IO.puts("You lose! the answer was #{random}")
      input < random ->
        IO.puts("Too Low!")
        game_loop({random, count - 1})
      input > random ->
        IO.puts("Too High!")
        game_loop({random, count - 1})
      true -> IO.puts("Correct!")
    end
  end

  def play do
    {Enum.random(1..10), @limit} |> game_loop()
  end
end
