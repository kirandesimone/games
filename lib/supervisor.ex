defmodule Games.Supervisor do
  @moduledoc """
  Supervisor for Games library
  """

  use Application

  def start(_start_type, _start_args) do
    children = [
      {Games.ScoreTracker, [name: "Score Tracker", score: 0]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
