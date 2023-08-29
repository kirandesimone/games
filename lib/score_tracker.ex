defmodule Games.ScoreTracker do
  @moduledoc """
  Player ScoreTracker for each game they play
  """

  use GenServer

  # Client API

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def add_points(points) do
    GenServer.cast(__MODULE__, {:add_points, points})
  end

  def get_points() do
    GenServer.call(__MODULE__, :get_points)
  end

  # Server API
  @impl true
  def init(init_arg) do
    starting_score = Keyword.get(init_arg, :score, 0)
    {:ok, starting_score}
  end

  @impl true
  def handle_call(:get_points, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:add_points, points}, state) do
    {:noreply, state + points}
  end
end
