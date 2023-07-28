defmodule Games.Wordle do
  @moduledoc """
  Documentation for `Wordle` game
  """
  defp feedback(answer, guess) do
    split_guess = String.split(guess, "", trim: true)

    Enum.zip_reduce([split_guess, answer], [], fn elements, acc ->
      elements
    end)
  end

  def play do
    answer = String.split("bbbbb", "", trim: true)
    feedback(answer, "aaaaa")
  end
end
