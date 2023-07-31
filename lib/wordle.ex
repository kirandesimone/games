defmodule Games.Wordle do
  @moduledoc """
  Documentation for `Wordle` game
  """
  @tries 6

  defp get_user_input,
    do: IO.gets("Enter a five letter word: ") |> String.trim("\n") |> String.downcase()

  defp game_loop(0), do: IO.puts("Sorry, You Lose!")

  defp game_loop(attemps) do
    guess = get_user_input()
    feedback("aaaaa", guess)
    game_loop(attemps - 1)
  end

  def feedback(answer, guess) do
    split_guess = String.split(guess, "", trim: true)
    split_answer = String.split(answer, "", trim: true)

    Enum.zip_reduce([split_guess, split_answer], [], fn elements, acc ->
      [first | tail] = elements
      [second] = tail

      cond do
        first == second -> [:green | acc]
        Enum.member?(split_answer, first) -> [:yellow | acc]
        true -> [:grey | acc]
      end
    end)
    |> Enum.reverse()
    |> IO.inspect()
  end

  def play do
    game_loop(@tries)
  end
end
