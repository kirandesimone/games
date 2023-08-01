defmodule Games.Wordle do
  @moduledoc """
  Documentation for `Wordle` game
  """
  @tries 6

  defp get_user_input,
    do: IO.gets("Enter a five letter word: ") |> String.trim("\n") |> String.downcase()

  defp game_loop(_, 0), do: IO.puts("Sorry, You Lose!")

  defp game_loop(answer, attemps) do
    guess = get_user_input()
    case feedback(answer, guess) do
      [:green, :green, :green, :green, :green] -> IO.puts("You Win!")
      _ -> game_loop(answer, attemps - 1)
    end
  end

  def feedback(answer, guess) do
    split_guess = String.split(guess, "", trim: true)

    Enum.zip_reduce([split_guess, answer], [], fn elements, acc ->
      [first | tail] = elements
      [second] = tail

      cond do
        first == second -> [:green | acc]
        Enum.member?(answer, first) -> [:yellow | acc]
        true -> [:grey | acc]
      end
    end)
    |> Enum.reverse()
    |> IO.inspect()
  end

  def play do
    answer = Enum.random(["pizza", "quick", "jiffy"])
    split_answer = String.split(answer, "", trim: true)
    game_loop(split_answer, @tries)
  end
end
