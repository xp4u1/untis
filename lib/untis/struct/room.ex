defmodule Untis.Struct.Room do
  defstruct [
    :id,
    :name,
    :long_name,
    :department_id,
    :fore_color,
    :back_color,
    :active,
    :display_allowed
  ]

  @doc false
  def from_map(jason_map) when is_nil(jason_map) do
    nil
  end

  @doc false
  def from_map(jason_map) do
    %Untis.Struct.Room{
      id: Map.get(jason_map, "id"),
      name: Map.get(jason_map, "name"),
      long_name: Map.get(jason_map, "longName"),
      department_id: Map.get(jason_map, "departmentId"),
      fore_color: Map.get(jason_map, "foreColor"),
      back_color: Map.get(jason_map, "backColor"),
      active: Map.get(jason_map, "active"),
      display_allowed: Map.get(jason_map, "displayAllowed")
    }
  end
end
