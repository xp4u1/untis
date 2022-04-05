defmodule Untis.Cache do
  @moduledoc false

  def update_master_data(master_data) do
    start_link()

    Agent.update(__MODULE__, fn _ ->
      master_data
    end)
  end

  def get_class(id) do
    current_state()["klassen"]
    |> Enum.filter(fn class ->
      class["id"] == id
    end)
  end

  def get_teacher(id) do
    current_state()["teachers"]
    |> Enum.filter(fn class ->
      class["id"] == id
    end)
  end

  def get_room(id) do
    current_state()["rooms"]
    |> Enum.filter(fn class ->
      class["id"] == id
    end)
  end

  def get_subject(id) do
    current_state()["subjects"]
    |> Enum.filter(fn class ->
      class["id"] == id
    end)
  end

  defp current_state() do
    Agent.get(__MODULE__, fn state -> state end)
  end

  defp start_link() do
    Agent.start_link(fn -> %{} end,
      name: __MODULE__
    )
  end
end
