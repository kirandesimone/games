defmodule Games.GuessingGame do
  @moduledoc """
  Documentation for `GuessingGame`
  """
  defp guess,
    do: IO.gets("Guess a number between 1 and 10: ") |> String.trim("\n") |> String.to_integer()

  defp game_loop(random) do
    input = guess()
    cond do
      input < random ->
        IO.puts("Too Low!")
        game_loop(random)
      input > random ->
        IO.puts("Too High!")
        game_loop(random)
      true -> IO.puts("Correct!")
    end
  end

  def play do
    Enum.random(1..10) |> game_loop()
  end
end
