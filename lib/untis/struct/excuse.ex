defmodule Untis.Struct.Excuse do
  defstruct [
    :date,
    :excuse_status_id,
    :id,
    :number,
    :text
  ]

  @doc false
  def from_map(jason_map) when is_nil(jason_map) do
    nil
  end

  @doc false
  def from_map(jason_map) do
    %Untis.Struct.Excuse{
      date: Map.get(jason_map, "date"),
      excuse_status_id: Map.get(jason_map, "excuseStatusId"),
      id: Map.get(jason_map, "id"),
      number: Map.get(jason_map, "number"),
      text: Map.get(jason_map, "text")
    }
  end
end
